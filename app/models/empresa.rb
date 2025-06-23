# app/models/empresa.rb
class Empresa < ApplicationRecord
  has_many :operarios, dependent: :nullify
end