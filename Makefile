.SECONDARY:

data/xls/%.xls:
	mkdir -p $(dir $@)
	curl -L --remote-time 'https://www.bja.gov/Funding/$(notdir $@)' -o $@.download
	mv $@.download $@

data/xls/%.xlsx:
	mkdir -p $(dir $@)
	curl -L --remote-time 'https://www.bja.gov/Funding/$(notdir $@)' -o $@.download
	mv $@.download $@

data/csv/county-fips.csv:
	curl -L --remote-time 'http://www2.census.gov/geo/docs/reference/codes/files/national_county.txt' -o $@.download
	mv $@.download $@

data/csv/2014-awards.csv: data/xls/14SCAAPawards.xls
data/csv/2013-awards.csv: data/xls/FY13_SCAAP_Awards.xlsx
data/csv/2012-awards.csv: data/xls/FY12_SCAAP_Awards.xlsx
data/csv/2011-awards.csv: data/xls/11SCAAPAwards.xls
data/csv/2010-awards.csv: data/xls/10SCAAPAwards.xls
data/csv/2009-awards.csv: data/xls/09SCAAPawards.xls
data/csv/2008-awards.csv: data/xls/08SCAAPAwards_Arch.xls
data/csv/2007-awards.csv: data/xls/07SCAAPAwards.xls
data/csv/2006-awards.csv: data/xls/06SCAAPAwards.xls

data/csv/%.csv: script/csv-from-xls
	mkdir -p $(dir $@)
	ruby script/csv-from-xls $@ $(word 2,$^)
