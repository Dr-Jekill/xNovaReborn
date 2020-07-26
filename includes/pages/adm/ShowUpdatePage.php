<?php

/**
 _  \_/ |\ | /¯¯\ \  / /\    |¯¯) |_¯ \  / /¯¯\ |  |   |´¯|¯` | /¯¯\ |\ |5
 ¯  /¯\ | \| \__/  \/ /--\   |¯¯\ |__  \/  \__/ |__ \_/   |   | \__/ | \|Core.
 * @author: Copyright (C) 2011 by Brayan Narvaez (Prinick) developer of xNova Revolution
 * @author web: http://www.bnarvaez.com
 * @link: http://www.xnovarev.com

 * @package 2Moons
 * @author Slaver <slaver7@gmail.com>
 * @copyright 2009 Lucky <douglas@crockford.com> (XGProyecto)
 * @copyright 2011 Slaver <slaver7@gmail.com> (Fork/2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.3 (2011-01-21)
 * @link http://code.google.com/p/2moons/

 * Please do not remove the credits
*/

if (!allowedTo(str_replace(array(dirname(__FILE__), '\\', '/', '.php'), '', __FILE__))) exit;
set_time_limit(0);

class ShowUpdatePage{
	public function check_integration($file, $hash){

		if(hash('sha256', $file) != $hash) return false;

		return true;
	}

	public function save_update(){
		global $template, $db;

		$update = $_FILES['update_pack'];
		$p_name = $update['name'];

		$msg = array(
			'update' 	=> array(),
			'new' 		=> array(),
			'deleted' 	=> array(),
			'sql'		=> array(),
		);

		if(!file_exists(ROOT_PATH.'temp'))
			mkdir(ROOT_PATH.'temp',0777);

		if(move_uploaded_file($update['tmp_name'], ROOT_PATH.'temp/update_to_install.zip')) {
			$zip = new ZipArchive;
			if ($zip->open(ROOT_PATH.'temp/update_to_install.zip') === TRUE) {
				$zip->extractTo(ROOT_PATH.'temp/', array('instalation.xml'));

				$update_content = simplexml_load_file(ROOT_PATH.'temp/instalation.xml');

				$rute = ROOT_PATH.'temp/'.$update_content->update_data->update_version;

				$zip->extractTo($rute);

				foreach ($update_content->update->item as $key => $file_) {
					$upd_rute = trim($file_['rute']);
					$hash = trim($file_['security']);
					$file = trim($file_);

					if(file_exists(ROOT_PATH.$upd_rute.$file)){
						if(!$this->check_integration(ROOT_PATH.$upd_rute.$file, $hash)){
							$zip->extractTo(ROOT_PATH.$upd_rute, array($file));
							$message['update'][] = ROOT_PATH.$upd_rute.$file;
							}
					}else{
						$zip->extractTo(ROOT_PATH.$upd_rute, array($file));
						$message['new'][] = ROOT_PATH.$upd_rute.$file;
					}
					unlink($rute.'/'.$file);
				}

				foreach ($update_content->delete->item as $key => $file_) {
					$del_rute = trim($file_['rute']);
					$file = trim($file_);

					if(!is_dir(ROOT_PATH.$del_rute.$file)){
						if(file_exists(ROOT_PATH.$del_rute.$file)){
							$message['deleted'][] = ROOT_PATH.$del_rute.$file;
							unlink(ROOT_PATH.$del_rute.$file);
						}
					}	
				}

				foreach ($update_content->sql->item as $key => $file_) {
					$file = trim($file_);
					$handle = fopen($rute.'/'.$file, "r");
					$contents = fread($handle, filesize($rute.'/'.$file));
					fclose($handle);
					$db->multi_query($contents);
					$message['sql'][] = $file;
					unlink($rute.'/'.$file);
				}

				$zip->close();

				$db->query("UPDATE ".CONF." SET VERSION='".$update_content->update_data->update_version."';");

				unlink(ROOT_PATH.'temp/update_to_install.zip');
				unlink($rute.'/instalation.xml');
				unlink(ROOT_PATH.'temp/instalation.xml');
				rmdir($rute);
				rmdir(ROOT_PATH.'temp/');
				
			}else{
				$message = array();
			}
		}
		
		return $message;

	}

	public function __construct(){
		$template	= new template();

		if($_FILES){
			$mess = $this->save_update();
			$template->assign_vars(array(
				'msg' => $mess,
			));
		}

		$template->assign_vars(array(

		));

		$template->show('adm/UpdatePage.tpl');
	}


}
?>