在html使用<script>嵌入javascript脚本的时候，不要在代码任何地方出现"</script>"字符串。
例如：
function say(){
       alert("</script>");
}
因为按照解析嵌入式代码的规则，当浏览器遇到字符串"</script>"时，就认为那里是结束的</script>，而通过把字符串分隔成两部分可以解决这个问题。
例如：
function say(){
   alert("<\/script>");
}