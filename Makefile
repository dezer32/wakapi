.PHONY: encrypt
encrypt:
	sops encrypt ./helm/secret.yaml > ./helm/secret.enc.yaml
	rm ./helm/secret.yaml

.PHONY: decrypt
decrypt:
	sops decrypt ./helm/secret.enc.yaml > ./helm/secret.yaml

.PHONY: install
install:
	helm secrets install wakapi ./helm -f ./helm/secret.enc.yaml

.PHONY: upgrade
upgrade:
	helm secrets upgrade wakapi ./helm -f ./helm/secret.enc.yaml
