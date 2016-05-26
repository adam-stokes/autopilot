compare-charm-store:
	./charm-store

commit-charm-store:
	CHARM_STORE_COMMIT=1 ./charm-store

clean:
	@rm -rf build

render:
	@./render-bundles

update-charm-revisions:
	@./update-charm-revisions \
		$(EXTRA_UPDATE_ARGUMENTS) \
		apache2 postgresql juju-gui haproxy rabbitmq-server nfs

.PHONY: clean render commit-charm-store update-charm-revisions compare-charm-store
