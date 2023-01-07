# 使用 PHP 发送 POST 请求

## 使用 file_get_contents

### 函数代码

```PHP
function send_post($url, $post_data) {
	$postdata = http_build_query($post_data);
	$options = array(
	    'http' => array(
	      'method' => 'POST',
	      'header' => 'Content-type:application/x-www-form-urlencoded',
	      'content' => $postdata,
	      'timeout' => 15 * 60
	)
	  );
	$context = stream_context_create($options);
	$result = file_get_contents($url, false, $context);
	return $result;
}
```

### 样例

```PHP
<?php
function send_post($url, $post_data) {
	$postdata = http_build_query($post_data);
	$options = array(
	    'http' => array(
	      'method' => 'POST',
	      'header' => 'Content-type:application/x-www-form-urlencoded',
	      'content' => $postdata,
	      'timeout' => 15 * 60
	)
	  );
	$context = stream_context_create($options);
	$result = file_get_contents($url, false, $context);
	return $result;
}

$data = array("data1" => data1);

send_post("http://localhost",$data);

?>
```

自行理解以下，很好理解的
