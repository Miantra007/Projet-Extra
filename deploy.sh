#!/bin/bash

set -e

APP_NAME="Patient"

BUILD_DIR="build"

SRC_DIR="src/main/java"

WEB_DIR="src/main/webapp"

TOMCAT_WEBAPPS="/home/miantra/Documents/Dossier/tomcat/tomcat/webapps"

TOMCAT_DIR="/home/miantra/Documents/Dossier/tomcat/tomcat"

echo "Nettoyage..."
rm -rf $BUILD_DIR

echo "Création de l'arborescence WAR..."
mkdir -p $BUILD_DIR/WEB-INF/lib

echo "Copie du web.xml..."
cp -r $WEB_DIR/* $BUILD_DIR/

echo "Compilation des fichiers Java..."

find $SRC_DIR -name "*.java" > sources.txt

CLASSPATH=$(echo lib/*.jar | tr ' ' ':')

javac -parameters -cp "$CLASSPATH" -d $BUILD_DIR/WEB-INF/classes @sources.txt
echo "Copie des ressources..."
cp -r src/main/resources/* $BUILD_DIR/WEB-INF/classes/

rm sources.txt

echo "Copie du framework..."
cp lib/*.jar $BUILD_DIR/WEB-INF/lib/

echo "Création du WAR..."
cd $BUILD_DIR || exit
jar -cf $APP_NAME.war *
cd ..

echo "Déploiement..."
cp $BUILD_DIR/$APP_NAME.war $TOMCAT_WEBAPPS/

echo "Redémarrage Tomcat..."
$TOMCAT_DIR/bin/shutdown.sh
sleep 2
$TOMCAT_DIR/bin/startup.sh

echo "Déploiement terminé."