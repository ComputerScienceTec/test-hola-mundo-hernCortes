#!/bin/bash
# Directorios
STUDENT_CODE="student_code/main.cpp"
TEST_INPUT_DIR="test_cases/"
EXPECTED_OUTPUT_DIR="test_cases/"
ACTUAL_OUTPUT="student_code/output.txt"
# Compilar el código del estudiante
echo $STUDENT_CODE
g++ student_code/main.cpp -o "student_code/student_program"
# Ejecutar el programa del estudiante con cada caso de prueba
for input_file in $TEST_INPUT_DIR/*.txt; do
    # Generar el nombre del archivo de salida esperado
    base_name=$(basename $input_file .txt)
    expected_output_file="${EXPECTED_OUTPUT_DIR}/output.txt"
    
    # Ejecutar el programa y capturar la salida
    ./student_code/student_program < $input_file > $ACTUAL_OUTPUT
    
    # Comparar el resultado con el esperado
    if diff -q $ACTUAL_OUTPUT $expected_output_file > /dev/null; then
        echo "Test ${base_name}: OK"
    else
        echo "Test ${base_name}: Falló"
        diff $ACTUAL_OUTPUT $expected_output_file
    fi
done