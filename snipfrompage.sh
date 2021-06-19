curl --silent 'https://www.badi-info.ch/_temp/zuerichsee-tiefenbrunnen.htm' | grep --only-matching --perl-regexp '(?<=<span class="t"><b> ).*(?= </b>&deg;C</span>)'
