#!/bin/bash

echo "Activando el entorno virtual"
if [ !"-d venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate

echo "instalando dependencias"
pip install --upgrade pip
pip install -r requirements.txt

mkdir -p reports

echo "Ejecutando pruebas"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Puebas finalizadas"