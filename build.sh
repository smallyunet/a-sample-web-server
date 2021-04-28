raco exe --orig-exe server.rkt
raco distribute server-temp server

rm server
mv server-temp server

ln -s bin/server server/server

tar -zcvf server.tar.gz server/
rm server/ -rv
