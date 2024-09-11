module Updated
  class Generator < Jekyll::Generator
    def generate(site)
      updated_docs = site.documents.select { |doc| doc.data['updated'] != nil }
			updated = []

			updated_docs.each { |updated_doc|
				# Create new hash and copy all keys from doc's data
				update = updated_doc.data.clone
				# Add id, url and collection label
				update['id'] = updated_doc.id
				update['url'] = updated_doc.url
				update['collection'] = updated_doc.collection.label
				# Add date from updated data value
				update['original_date'] = update['date']
				update['date'] = update['updated']
				# Add hash to updated
				updated << update
			}

			site.data['updated'] = updated
    end
  end
end
