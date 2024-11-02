read -p "Название проекта: " project_name

mkdir -p $project_name/src

mkdir -p $project_name/src/scripts $project_name/src/styles $project_name/src/images 

touch $project_name/README.md $project_name/.gitignore


echo "Done.."