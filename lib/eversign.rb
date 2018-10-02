require 'eversign/version'
require 'configurations'
require 'addressable/uri'
require 'eversign/client'
require 'eversign/models/business'
require 'eversign/models/file'
require 'eversign/models/field'
require 'eversign/models/signer'
require 'eversign/models/recipient'
require 'eversign/models/document'
require 'eversign/models/template'
require 'eversign/models/error'
require 'eversign/models/exception'
require 'eversign/mappings/business'
require 'eversign/mappings/file'
require 'eversign/mappings/document'
require 'eversign/mappings/exception'

module Eversign
	include Configurations
	configurable String,  :access_key
	configurable Integer, :business_id
	configurable String,  :oauth_base
	configurable String,  :api_base 
end
