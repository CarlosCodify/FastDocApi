
# Limpiar registros existentes
DocumentType.destroy_all

# Crear varios tipos de documentos
document_types_data = [
  { name: 'Sobre', description: 'Documento en sobre' },
  { name: 'Archivador', description: 'Documento en archivador' },
  { name: 'Libro', description: 'Libro' },
]

document_types_data.each do |data|
  DocumentType.create!(data)
end

puts 'Document Types seeded successfully'