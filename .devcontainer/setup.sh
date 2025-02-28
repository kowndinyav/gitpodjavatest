#!/bin/bash

# Download and setup Tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz

tar xvf apache-tomcat-9.0.98.tar.gz
rm apache-tomcat-9.0.98.tar.gz
mv apache-tomcat-9.0.98 ~/tomcat

# Make Tomcat scripts executable
chmod +x ~/tomcat/bin/*.sh

# Build the project
mvn clean package

# Deploy WAR to Tomcat
cp target/*.war ~/tomcat/webapps/

# Create a convenience script for rebuild and redeploy
cat > ~/rebuild.sh << 'EOL'
#!/bin/bash
mvn clean package
cp target/*.war ~/tomcat/webapps/
EOL

chmod +x ~/rebuild.sh