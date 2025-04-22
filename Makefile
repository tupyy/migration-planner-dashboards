AM_DASHBOARDS ?= $(PWD)/am.json
SD_DASHBOARDS ?= $(PWD)/sd.json
SLO_DASHBOARDS ?= $(PWD)/slo.json

am: UPDATED_DASHBOARD=updated-dashboard
am: DASHBOARD=grafana-dashboard-assisted-migrations
am:
	@oc create configmap grafana-dashboard-assisted-migrations --from-file=$(AM_DASHBOARDS) -o yaml --dry-run=client > $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@tail -n 4 $(PWD)/dashboards/$(DASHBOARD).yaml >> $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@mv $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml $(PWD)/dashboards/$(DASHBOARD).yaml

sd: UPDATED_DASHBOARD=updated-dashboard
sd: DASHBOARD=grafana-dashboard-service-dashboard
sd:
	@oc create configmap grafana-dashboard-service-dashboard --from-file=$(SD_DASHBOARDS) -o yaml --dry-run=client > $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@tail -n 4 $(PWD)/dashboards/$(DASHBOARD).yaml >> $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@mv $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml $(PWD)/dashboards/$(DASHBOARD).yaml

slo: UPDATED_DASHBOARD=updated-dashboard
slo: DASHBOARD=grafana-dashboard-slo
slo:
	@oc create configmap grafana-dashboard-slo --from-file=$(SLO_DASHBOARDS) -o yaml --dry-run=client > $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@tail -n 4 $(PWD)/dashboards/$(DASHBOARD).yaml >> $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml
	@mv $(PWD)/dashboards/$(UPDATED_DASHBOARD).yaml $(PWD)/dashboards/$(DASHBOARD).yaml
