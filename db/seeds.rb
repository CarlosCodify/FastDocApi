# # db/seeds.rb

# # Crear 10 Motorcyclists, Person y Motorcycles asociados
# 10.times do |i|
#   person = Person.create!(
#     name: "Person#{i}",
#     surname: "Surname#{i}",
#     lastname: "Lastname#{i}",
#     phone: "12345678#{i}",
#     email: "person#{i}@example.com",
#     identity_document: "ABC1234#{i}"
#   )

#   motorcyclist = Motorcyclist.create!(person: person)

#   # Cada Motorcyclist tendrá 2 Motorcycles
#   2.times do |j|
#     Motorcycle.create!(
#       model: "Model#{i}-#{j}",
#       license_plate: "Plate#{i}-#{j}",
#       active: [true, false].sample,
#       motorcyclist: motorcyclist
#     )
#   end
# end

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