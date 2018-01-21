#\ -w -o 0.0.0.0 -p 4569
app = proc { |env| ['200', { 'Content-Type' => 'text/html' }, ['get rack\'d']] }

run app
