
ALTER TABLE custappinfo
ADD FOREIGN KEY (countryvisatypelistId) REFERENCES countryvisatypelist (countryvisatypelistId)


ALTER TABLE custappinfo
ADD FOREIGN KEY (CountryListID) REFERENCES CountryList (CountryListId)