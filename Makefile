all: output/keyrings/debiancn-keyring.gpg output/sha512sums.txt output/README output/changelog

output/keyrings/debiancn-keyring.gpg: debiancn-keyring-gpg/0x*
	cat debiancn-keyring-gpg/0x* > output/keyrings/debiancn-keyring.gpg

#output/keyrings/removed-keys.gpg: removed-keys-gpg/0x*
#	cat removed-keys-gpg/0x* > output/keyrings/removed-keys.gpg

output/sha512sums.txt: output/keyrings/debiancn-keyring.gpg
	cd output; sha512sum keyrings/* > sha512sums.txt

output/README: README
	cp README output/

output/changelog: debian/changelog
	cp debian/changelog output/

#test: all
#	./runtests

clean:
	rm -f output/keyrings/*.gpg output/sha512sums.txt output/README output/changelog output/keyrings/*~
