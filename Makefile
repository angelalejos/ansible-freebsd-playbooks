# ansible: src/ansible/hacking/env-setup
# 	source src/ansible/hacking/env-setup

bin/ansible: src/ansible/setup.py bin/pip
	bin/pip install -e src/ansible

library/ezjail: src/ezjailansible/ezjail.py
	ln -s src/ezjailansible/ezjail.py library/ezjail

src/ansible/setup.py: bin/buildout
	bin/buildout

bin/buildout: bin/pip
	bin/pip install zc.buildout

bin/python bin/pip:
	virtualenv .

clean:
	git clean -fXd

.PHONY: clean
