#!/bin/bash

create_course_structure() {
    local course_name="$1"
    local students_count="$2"
    local student_names=()

    if [ ! -d "$course_name" ]; then
        mkdir -p "$course_name"
    fi

    mkdir -p "$course_name/Студенты"
    touch "$course_name/Оценки.txt"

    for i in $(seq 1 $students_count); do
        read -p "Введите имя студента $i: " student_name
        student_names+=("$student_name")
    done

    for student in "${student_names[@]}"; do
        echo "$student: 5" >> "$course_name/Оценки.txt"
    done

    echo "Структура курса '$course_name' создана успешно:"
    echo "  - Создан каталог: $course_name"
    echo "  - Создан подкаталог: $course_name/Студенты"
    echo "  - Создан файл: $course_name/Оценки.txt"
    echo "  - Добавлены оценки для ${#student_names[@]} студентов"
}

echo "Добро пожаловать в создателя структуры курса!"
echo "Пожалуйста, введите следующую информацию:"

read -p "Введите имя курса: " course_name

while true; do
    read -p "Введите количество студентов (0 для завершения): " students_count
    if [ $students_count -eq 0 ]; then
        break
    elif [ $students_count -lt 0 ]; then
        echo "Неверный ввод. Пожалуйста, попробуйте снова."
    else
        create_course_structure "$course_name" "$students_count"
        break
    fi
done

echo "Выполнение сценария завершено."

