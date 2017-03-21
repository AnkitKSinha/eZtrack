# eZtrack
<h2>MySQL Server</h2>
<p>
  <i>Download and install mysql server </i>
  <pre>$sudo apt-get install mysql-server-5.6</pre>
  <i>Create db eztrack</i>
  <pre>$mysql</pre>
  <pre> >>>create database eztrack</pre>
  <pre> >>>exit</pre>
  
  <i>import eztrack.sql </i>
  <pre>$ mysql -u root -p -h localhost eztrack &lt  &lteztrack folder&gt/Databases/eztrack.sql </pre>
</p>


<h2>Tomcat 8.0</h2>
<p style="margin-left:20px">
  <i>Go to home dir</i>
  <pre>$cd ~</pre>
  <i>Create dir Tomcat</i>
  <pre>$mkdir Tomcat</pre>
   <i>Move to Tomcat</i>
  <pre>$cd Tomcat</pre>
  <i>Download Tomcat</i>
  <pre>$wget http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.0.37/bin/apache-tomcat-8.0.37.tar.gz</pre>
   (Might be different)<br>
   <i>Extrack Tomcat</i>
   <pre>$tar xvf apache-tomcat-8.0.37.tar.gz</pre>
   <i>Copy eztrack.war to webapps/</i>
   <pre>$cp &lt eztrack folder &gt/Server/eztrack.war  ./apache-tomcat-8.0.37/webapps</pre>
   <i>Run Tomcat</i>
   <pre>$./bin/startup.sh</pre>
</p>


