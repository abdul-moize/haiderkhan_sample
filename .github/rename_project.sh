#!/usr/bin/env bash
while getopts a:e:n:u:d: flag
do
    case "${flag}" in
        a) author=${OPTARG};;
        e) email=${OPTARG};;
        n) name=${OPTARG};;
        u) urlname=${OPTARG};;
        d) description=${OPTARG};;
    esac
done

echo "Author: $author";
echo "Author Email: $email";
echo "Project Name: $name";
echo "Project URL name: $urlname";
echo "Description: $description";

echo "Renaming project..."

original_author="abdul-moize"
original_email="null"
original_name="haiderkhan_sample"
original_urlname="haiderkhan_sample"
original_description="null"
# for filename in $(find . -name "*.*")
for filename in $(git ls-files)
do
    sed -i "s/$original_author/$author/g" $filename
    sed -i "s/$original_email/$email/g" $filename
    sed -i "s/$original_name/$name/g" $filename
    sed -i "s/$original_urlname/$urlname/g" $filename
    sed -i "s/$original_description/$description/g" $filename
    echo "Renamed $filename"
done

mv haiderkhan_sample $name

# This command runs only once on GHA!
rm -rf .github/template.yml
