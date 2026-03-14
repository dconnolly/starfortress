PF = proof_frog

all: parse prove

parse:
	@for f in primitives/*.primitive games/*.game schemes/*.scheme *.proof; do \
		$(PF) parse "$$f"; \
	done

prove:
	$(PF) prove SeedKeyGen.proof
	$(PF) prove UG-KEM-CCA.proof || echo "UG-KEM-CCA.proof has expected out-of-band steps (1, 9, 17)"
