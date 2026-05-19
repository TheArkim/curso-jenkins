#!/bin/bash

echo "ingresando al proyecto"
cd proyecto_pytest

echo "Activando el entorno virtual"
source venv/bin/activate

echo "instalando dependencias"
pip install -r requirements.txt

echo "Ejecutando pruebas"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Puebas finalizadas"