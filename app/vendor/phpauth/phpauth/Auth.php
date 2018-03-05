<?php
namespace PHPAuth;
use ZxcvbnPhp\Zxcvbn;

class Auth
{
protected $db;
public $product;
public $user;
public $lng;

public function __construct(\PDO $db,$product,$user,$lng){
    $this->db=$db;
    $this->product=$product;
    $this->user=$user;
    $this->lng=$lng;

    if(version_compare(phpversion(),'5.4.0','<')){die('PHP 5.4.0 required!');}
    if(version_compare(phpversion(),'5.5.0','<')){require 'password.php';}
}

#Проверка Recaptcha
private function captcha_check($captcha){
try{
    $url='https://www.google.com/recaptcha/api/siteverify';
    $data=['secret'=> $this->product['recaptcha_secret'],'response'=>$captcha,'remoteip'=>$this->user['ip']];
    $options=['http'=>['header'=>"Content-type: application/x-www-form-urlencoded\r\n",'method' =>'POST','content'=>http_build_query($data)]];
    $context =stream_context_create($options);
    $result=file_get_contents($url,false,$context);
    return json_decode($result)->success;
    }
    catch (\Exception $e){
        return false;
    }
}

#OAuth вход
public function signin_OAuth($id,$service){
    $query=$this->db->prepare("SELECT id FROM users WHERE oauth_id=? AND oauth_service=? AND product_id=?");
    $query->execute(array($id,$service,$this->product['id']));
    if($query->rowCount()==0){return false;}
    $user=$query->fetch(\PDO::FETCH_ASSOC);
    $this->auth($user['id']);
    return true;
}

#Вход
public function signin($email,$password){
    $return['status']='error';
    $email=strtolower($email);

    $validate_email=$this->validate_email($email);

    if($validate_email['status']!='success'){
        $return['status']='email';
        $return['message']=$validate_email['message'];
        return $return;
    }
	
    $validate_password=$this->validate_password($password);
	
	if($validate_password['status']!='success'){
        $return['status']='password';
        $return['message']=$validate_password['message'];
        return $return;
    }

    $query=$this->db->prepare("SELECT id FROM users WHERE email=? AND product_id=?");
    $query->execute(array($email,$this->product['id']));

    if($query->rowCount()==0){
        $return['status']='email';
        $return['message']=$this->lng['email_not_found'];
        return $return;
    }

    $user=$this->get_user_info($query->fetch(\PDO::FETCH_ASSOC)['id']);
	
	if($user===false){
        $return['status']='error';
        $return['message']=$this->lng['error_system'];
        return $return;
	}

    if(!password_verify($password,$user['password'])){
        $return['status']='password';
        $return['message']=$this->lng['password_incorrect'];
        return $return;
    }

    if($user['isactive']!=1){
        $return['status']='activation';
        $return['message']=sprintf($this->lng['account_inactive'],$user['id']);
        return $return;
    }

    $auth=$this->auth($user['id']);

    $return['status']='success';
    return $return;
}

#Регистрация через OAuth сервис
public function signup_OAuth($id,$service,$params=Array()){
    $return['status']='error';
	
    $query=$this->db->prepare("INSERT INTO users VALUES()");
    $query->execute();

    $uid=$this->db->lastInsertId();

    if(is_array($params)&& count($params)>0){$customParamsQueryArray=Array();foreach($params as $paramKey=>$paramValue){$customParamsQueryArray[]=array('value'=>$paramKey.'=?');}$setParams=', '.implode(', ',array_map(function($entry){return $entry['value'];},$customParamsQueryArray));}else{$setParams='';}

    $query=$this->db->prepare("UPDATE users SET oauth_id=?, oauth_service=?, isactive=?, product_id=?, time=? {$setParams} WHERE id=?");
	
   if(!$query->execute(array_values(array_merge(array($id,$service,1,$this->product['id'],time()),$params,array($uid))))){
        $query=$this->db->prepare("DELETE FROM users WHERE id=? AND product_id=?");
        $query->execute(array($uid,$this->product['id']));
        $return['message']=$this->lng['system_error'];
        return $return;
    }

    $return['status']='success';
    return $return;
}

#Регистрация
public function signup($email,$password,$password_confirmation,$params=Array(),$sendmail=NULL,$captcha=null){
    $return['status']='error';
    $email=strtolower($email);
	
//    if(!$this->captcha_check($captcha)){
//		$return['status']='captcha';
//        $return['message']=$lng['error_captcha'];
//        return $return;
//    }
	
    $validate_email=$this->validate_email($email);

    if($validate_email['status']!='success'){
		$return['status']='email';
        $return['message']=$validate_email['message'];
        return $return;
    }
	
    if($email==$password){
		$return['status']='password';
        $return['message']=$this->lng['password_email_match'];
        return $return;
    }

    $validate_password=$this->validate_password($password);

    if($validate_password['status']!='success'){
		$return['status']='password';
        $return['message']=$validate_password['message'];
        return $return;
    }
	
	if(strlen($password_confirmation)==0){
		$return['status']='password_confirmation';
		$return['message']=$this->lng['password_blank'];
		return $return;
	}
	
    if($password!==$password_confirmation){
		$return['status']='password_confirmation';
        $return['message']=$this->lng['password_nomatch'];
        return $return;
    }

    $query=$this->db->prepare("SELECT count(*) FROM users WHERE email=? AND product_id=?");
    $query->execute(array($email,$this->product['id']));

    if($query->fetchColumn()>0){
		$return['status']='email';
        $return['message']=$this->lng['email_taken'];
        return $return;
    }
	
    $query=$this->db->prepare("INSERT INTO users VALUES()");
    $query->execute();
    $uid=$this->db->lastInsertId();

	$isactive=1;
	
    if($sendmail){
    $request_add=$this->request_add($uid,'activation');
	$return['request_id']=$request_add['request_id'];
    $return['code']=$request_add['code'];
    $isactive=0;
    }

    $password=$this->hash_password($password);

    if(is_array($params)&& count($params)>0){$customParamsQueryArray=Array();foreach($params as $paramKey=>$paramValue){$customParamsQueryArray[]=array('value'=>$paramKey.'=?');}$setParams=', '.implode(', ',array_map(function($entry){return $entry['value'];},$customParamsQueryArray));}else{$setParams='';}

    $query=$this->db->prepare("UPDATE users SET email=?, password=?, isactive=?, product_id=?, time=? {$setParams} WHERE id=?");

    $bindParams=array_values(array_merge(array($email,$password,$isactive,$this->product['id'],time()),$params,array($uid)));

    if(!$query->execute($bindParams)){
        $query=$this->db->prepare("DELETE FROM users WHERE id=? AND product_id=?");
        $query->execute(array($uid,$this->product['id']));
        $return['message']=$this->lng['system_error'];
        return $return;
    }

    $return['uid']=$uid;
    $return['status']='success';
    return $return;
}

#Подтверждение email с помощью кода активации
public function activation($code,$request_id){
    $return['status']='error';

    if(strlen($code)!==20 || !is_numeric($request_id)){$return['message']=$this->lng['activation_code_invalid'];return $return;}

    $request_get=$this->request_get($code,$request_id,'activation');

    if($request_get['status']!='success'){
        $return['message']=$request_get['message'];
        return $return;
    }

    $query=$this->db->prepare("UPDATE users SET isactive=? WHERE id=? AND product_id=?");
    $query->execute(array(1,$request_get['uid'],$this->product['id']));

    $this->request_delete($request_get['id']);

    $return['status']='success';
    $return['uid']=$request_get['uid'];
    return $return;
}

#Создание запроса на сброс пароля
public function password_reset_request($email){
    $return['status']='error';
	$email=strtolower($email);

    $validate_email=$this->validate_email($email);

    if($validate_email['status']!='success'){
		$return['status']='email';
        $return['message']=$validate_email['message'];
        return $return;
    }

    $query=$this->db->prepare("SELECT id FROM users WHERE email=? AND product_id=?");
    $query->execute(array($email,$this->product['id']));

    if($query->rowCount()==0){
		$return['status']='email';
        $return['message']=$this->lng['email_not_found'];
        return $return;
    }

    $request_add=$this->request_add($query->fetch(\PDO::FETCH_ASSOC)['id'],'reset');

	$return['request_id']=$request_add['request_id'];
    $return['code']=$request_add['code'];
    $return['status']='success';
    $return['message']=$this->lng['reset_requested'];

    return $return;
}

#Выход
public function signout($hash){
    $query=$this->db->prepare("DELETE FROM sessions WHERE hash=? AND product_id=?");
    $query->execute(array($hash,$this->product['id']));
	if($query->rowCount()>0){unset($_SESSION['authID']);unset($_SESSION['two_factor']);}
    return true;
}

#Хеширование пароля
public function hash_password($password){
    return password_hash($password,PASSWORD_BCRYPT,['cost'=>10]);
}

#Добавление сессии авторизации и авторизация пользователя
public function auth($uid){
	$query=$this->db->prepare("SELECT two_factor FROM users WHERE id=? AND product_id=?");
    $query->execute(array($uid,$this->product['id']));
	$row=$query->fetch(\PDO::FETCH_ASSOC);
	
    $query=$this->db->prepare("DELETE FROM sessions WHERE uid=? AND product_id=?");
    $query->execute(array($uid,$this->product['id']));
	$data['hash']=sha1($this->generate_random_string().microtime());
    $query=$this->db->prepare("INSERT INTO sessions (uid, hash, ip, agent, time, product_id) VALUES (?, ?, ?, ?, ?, ?)");
    if($query->execute(array($uid,$data['hash'],$this->user['ip'],$_SERVER['HTTP_USER_AGENT'],time(),$this->product['id']))){$_SESSION['authID']=$data['hash'];$_SESSION['two_factor']=$row['two_factor'];}
    return true;
}

#Получение данных о пользователе
protected function get_user_info($uid){
    $query=$this->db->prepare("SELECT id, email, password, isactive FROM users WHERE id=? AND product_id=?");
    $query->execute(array($uid,$this->product['id']));

    if($query->rowCount()==0){return false;}

    $data=$query->fetch(\PDO::FETCH_ASSOC);

    if(!$data){return false;}

    return $data;
}

#Создание кода активации учетной записи или кода сброса пароля
protected function request_add($uid,$type){
    $query=$this->db->prepare("SELECT id FROM requests WHERE uid=? AND type=? AND product_id=?");
    $query->execute(array($uid,$type,$this->product['id']));

    if($query->rowCount()>0){
        $row=$query->fetch(\PDO::FETCH_ASSOC);
        $this->request_delete($row['id']);
    }

    $code=$this->generate_random_string(20);

    $query=$this->db->prepare("INSERT INTO requests (uid, code, time, type, product_id) VALUES (?, ?, ?, ?, ?)");
    $query->execute(array($uid,$code,time(),$type,$this->product['id']));

    $return['request_id']=$this->db->lastInsertId();
    $return['code']=$code;
    return $return;
}

#Получение информации по запросу на активацию учетной записи или на сброс пароля
public function request_get($code,$request_id,$type){
    $return['status']='error';

    $query=$this->db->prepare("SELECT uid FROM requests WHERE code=? AND id=? AND type=? AND product_id=?");
    $query->execute(array($code,$request_id,$type,$this->product['id']));

    if($query->rowCount()===0){
        $return['message']=$this->lng[$type.'_code_invalid'];
        return $return;
    }

    $row=$query->fetch();

    $return['status']='success';
    $return['id']=$request_id;
    $return['uid']=$row['uid'];
    return $return;
}

#Удаление запроса на активацию учетной записи или на сброс пароля
public function request_delete($id){
    $query=$this->db->prepare("DELETE FROM requests WHERE id=? AND product_id=?");
    return $query->execute(array($id,$this->product['id']));
}

#Проверка пароля на валидность и соответствие требованиям безопасности
protected function validate_password($password){
    $return['status']='error';

	if(strlen($password)==0){
		$return['message']=$this->lng['password_blank'];
		return $return;
	}
	
    if(strlen($password)<6){
		$return['message']=$this->lng['password_too_short'];
		return $return;
	}

    if(strlen($password)>60){
		$return['message']=$this->lng['password_too_long'];
		return $return;
	}
	
   /*$zxcvbn=new Zxcvbn();
    if($zxcvbn->passwordStrength($password)['score']<0){
        $return['message']=$this->lng['password_too_weak'];
        return $return;
    }*/

    $return['status']='success';
    return $return;
}

#Валидация email
protected function validate_email($email){
    $return['status']='error';

    if(strlen($email)==0){
		$return['message']=$this->lng['email_blank'];
		return $return;
	}
	
	if(strlen($email)>100){
		$return['message']=$this->lng['email_long'];
		return $return;
		}
	
	if(!filter_var($email,FILTER_VALIDATE_EMAIL)){
		$return['message']=$this->lng['email_invalid'];
		return $return;
	}
	
	$banned_domains=json_decode(file_get_contents(__DIR__ .'/banned_domains.json'));
	$domain=strtolower(explode('@',$email)[1]);
	
	if(in_array($domain,$banned_domains)){
		$return['message']=sprintf($this->lng['email_banned'],$domain);
		return $return;	
	}

    $return['status']='success';
    return $return;
}

#Смена пароля на новый с помощью кода сброса пароля
public function password_reset($code,$request_id,$new_password,$new_password_confirmation){
    $return['status']='error';

    if(strlen($code)!=20 || !is_numeric($request_id)){$return['message']=$this->lng['reset_code_invalid'];return $return;}

    $validate_password=$this->validate_password($new_password);

    if($validate_password['status']!='success'){
		$return['status']='new_password';
        $return['message']=$validate_password['message'];
        return $return;
    }
	
	if(strlen($new_password_confirmation)==0){
		$return['status']='new_password_confirmation';
		$return['message']=$this->lng['password_blank'];
		return $return;
	}

    if($new_password!==$new_password_confirmation){
		$return['status']='new_password_confirmation';
        $return['message']=$this->lng['passwords_differ'];
        return $return;
    }

    $request_get=$this->request_get($code,$request_id,'reset');

    if($request_get['status']!='success'){
        $return['message']=$request_get['message'];
        return $return;
    }

    $user=$this->get_user_info($request_get['uid']);
	
    if($user['email']==$new_password){
		$return['status']='new_password';
        $return['message']=$this->lng['password_email_match'];
        return $return;
    }

    if(password_verify($new_password,$user['password'])){
		$return['status']='new_password';
        $return['message']=$this->lng['password_the_same'];
        return $return;
    }

    $new_password=$this->hash_password($new_password);
    $query=$this->db->prepare("UPDATE users SET password=? WHERE id=? AND product_id=?");
    $query->execute(array($new_password,$request_get['uid'],$this->product['id']));

	$this->request_delete($request_get['id']);

	$this->auth($request_get['uid']);
	
    $return['status']='success';
    return $return;
}

#Повторное создание запроса на активацию учетной записи
public function activation_resend($user_id){
    $return['status']='error';

    $query=$this->db->prepare("SELECT * FROM requests WHERE uid=? AND type=? AND product_id=?");
    $query->execute(array($user_id,'activation',$this->product['id']));
	$row=$query->fetch(\PDO::FETCH_ASSOC);

    if($query->rowCount()==0){
        return $return;
    }
	
	$user_info=$this->get_user_info($user_id);

    if($user_info['isactive']==1){
        return $return;
    }

    if(($row['time']+180)>time()){
		$return['status']='time';
		$return['time']=(180-time()+$row['time']);
        return $return;
    }

    $request_add=$this->request_add($user_id,'activation');
	$return['user_email']=$user_info['email'];
	$return['request_id']=$request_add['request_id'];
    $return['code']=$request_add['code'];
    $return['status']='success';
    return $return;
}

#Смена пароля
public function password_change($uid,$current_password,$new_password,$new_password_confirmation){
    $return['status']='error';

    $validate_password=$this->validate_password($current_password);

    if($validate_password['status']!='success'){
		$return['status']='current_password';
        $return['message']=$validate_password['message'];
        return $return;
    }

    if($current_password==$new_password){
		$return['status']='new_password';
        $return['message']=$this->lng['password_the_same'];
        return $return;
    }

    $validate_password=$this->validate_password($new_password);

    if($validate_password['status']!='success'){
		$return['status']='new_password';
        $return['message']=$validate_password['message'];
        return $return;
    }
	
	if(strlen($new_password_confirmation)==0){
		$return['status']='new_password_confirmation';
		$return['message']=$this->lng['password_blank'];
		return $return;
	}
	
	if($new_password!==$new_password_confirmation){
	    $return['status']='new_password';
        $return['message']=$this->lng['passwords_differ'];
        return $return;
    }

    $user=$this->get_user_info($uid);

    if(!password_verify($current_password,$user['password'])){
		$return['status']='current_password';
        $return['message']=$this->lng['password_incorrect'];
        return $return;
    }

    $query=$this->db->prepare("UPDATE users SET password=? WHERE id=? AND product_id=?");
    $query->execute(array($this->hash_password($new_password),$uid,$this->product['id']));

    $return['status']='success';
    $return['message']=$this->lng['password_changed'];
    return $return;
}

#Генерация случайной строки заданной велечены
public function generate_random_string($length=20){
    $chars="A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6";
    $key='';
    for($i=0;$i<$length;$i++){$key.=$chars{mt_rand(0,strlen($chars)-1)};}
    return $key;
}

#Проверка сессии авторизации
public function logged_in(){
	$return['flag']=false;

	if(!isset($_SESSION['authID']) || strlen($_SESSION['authID'])!=40){return $return;}

    $query=$this->db->prepare("SELECT id, uid, time FROM sessions WHERE hash=? AND product_id=?");
    $query->execute(array($_SESSION['authID'],$this->product['id']));

    if($query->rowCount()==0){return $return;}

    $row=$query->fetch(\PDO::FETCH_ASSOC);

    if(time()>($row['time']+604800)){
		$auth->signout($_SESSION['authID']);
        return $return;
    }

	$return['uid']=$row['uid'];
	$return['flag']=true;
    return $return;
}
}