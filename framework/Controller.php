<?php

namespace Framework;

class Controller
{
    public function view($template_path, $data){
        $template = file_get_contents('src/Views/'.$template_path);
        ob_start();
        eval("?>".$template."<?");
        $content = ob_get_contents();
        ob_clean();
        return $content;
    }
}
?>
