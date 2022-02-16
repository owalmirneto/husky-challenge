# frozen_string_literal: true

module Invoices
  class UploadPDF < ApplicationInteractor
    FILE_ACL = 'public-read'

    def call
      file.upload_file(origin_filename)
      file.acl.put(acl: FILE_ACL)

      context.public_url = file.public_url
    end

    private

    def file
      @file ||= bucket.object(destination_filename)
    end

    def bucket
      @bucket ||= Aws::S3::Resource.new.bucket(ENV.fetch('AWS_S3_BUCKET'))
    end

    def origin_filename
      "#{Rails.root}/tmp/#{context.filename}"
    end

    def destination_filename
      "invoices/#{context.filename}"
    end
  end
end
