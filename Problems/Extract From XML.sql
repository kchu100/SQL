  /*
  https://app.codesignal.com/arcade/db/specialties/GvJFyTbHdFqWtXTxc
  */
  select ExtractValue(xml_doc, '/descendant-or-self::author[1]') as author 
	from catalogs
	order by author;
