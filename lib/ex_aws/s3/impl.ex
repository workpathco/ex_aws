defmodule ExAws.S3.Impl do
  import ExAws.S3.Request

  @moduledoc "See ExAws.S3.Adapter for documentation"

  ## Buckets
  #############

  def list_buckets(adapter, opts) do
    request(adapter, :get, "", "/", params: opts)
  end

  def delete_bucket(adapter, bucket) do
    request(adapter, :delete, bucket, "/")
  end

  def delete_bucket_cors(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "cors")
  end

  def delete_bucket_lifecycle(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "lifecycle")
  end

  def delete_bucket_policy(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "policy")
  end

  def delete_bucket_replication(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "replication")
  end

  def delete_bucket_tagging(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "tagging")
  end

  def delete_bucket_website(adapter, bucket) do
    request(adapter, :delete, bucket, "/", resource: "website")
  end

  def list_objects(adapter, bucket, opts) do
    request(adapter, :get, bucket, "/", params: opts)
  end

  def get_bucket_acl(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "acl")
  end

  def get_bucket_cors(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "cors")
  end

  def get_bucket_lifecycle(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "lifecycle")
  end

  def get_bucket_policy(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "policy")
  end

  def get_bucket_location(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "location")
  end

  def get_bucket_logging(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "logging")
  end

  def get_bucket_notification(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "notification")
  end

  def get_bucket_replication(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "replication")
  end

  def get_bucket_tagging(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "tagging")
  end

  def get_bucket_object_versions(adapter, bucket, opts) do
    request(adapter, :get, bucket, "/", resource: "versions", params: opts)
  end

  def get_bucket_request_payment(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "requestPayment")
  end

  def get_bucket_versioning(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "versioning")
  end

  def get_bucket_website(adapter, bucket) do
    request(adapter, :get, bucket, "/", resource: "website")
  end

  def head_bucket(adapter, bucket) do
    request(adapter, :head, bucket, "/")
  end

  def list_multipart_uploads(adapter, bucket, opts) do
    request(adapter, :get, bucket, "/", resource: "uploads", params: opts)
  end

  def put_bucket(adapter, bucket, region, opts) do
    body = """
    <CreateBucketConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
      <LocationConstraint>#{region}</LocationConstraint>
    </CreateBucketConfiguration>
    """
    request(adapter, :put, bucket, "/", body: body, headers: opts)
  end

  def put_bucket_acl(adapter, bucket, _owner_id, _owner_email, _grants) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_cors(adapter, bucket, _cors_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_lifecycle(adapter, bucket, _livecycle_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_policy(adapter, bucket, _policy) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_logging(adapter, bucket, _logging_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_notification(adapter, bucket, _notification_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_replication(adapter, bucket, _replication_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_tagging(adapter, bucket, _tags) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_requestpayment(adapter, bucket, _payer) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_versioning(adapter, bucket, _version_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  def put_bucket_website(adapter, bucket, _website_config) do
    raise "not yet implimented"
    request(adapter, :put, bucket, "/")
  end

  ## Objects
  ###########

  def delete_object(adapter, bucket, object) do
    request(adapter, :delete, bucket, object)
  end

  def delete_multiple_objects(adapter, bucket, objects) do
    raise "not yet implimented"
    request(adapter, :post, bucket, "/?delete")
  end

  def get_object(adapter, bucket, object, _opts) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def get_object_acl(adapter, bucket, object, _opts) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def get_object_torrent(adapter, bucket, object) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def head_object(adapter, bucket, object, _opts) do
    raise "not yet implimented"
    request(adapter, :head, bucket, object)
  end

  def options_object(adapter, bucket, object, _origin, _request_method, _request_headers) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def post_object(adapter, bucket, object) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def post_object_restore(adapter, bucket, object, _version_id, _number_of_days) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def put_object(adapter, bucket, object, body, opts) do
    headers = [
      {"Content-Type", "binary/octet-stream"} |
      opts |> Map.to_list
    ]
    request(adapter, :put, bucket, object, body: body, headers: headers)
  end

  def put_object_acl(adapter, bucket, object, _acl) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def put_object_copy(adapter, dest_bucket, dest_object, _src_bucket, _src_object, _opts) do
    raise "not yet implimented"
    request(adapter, :get, dest_bucket, dest_object)
  end

  def initiate_multipart_upload(adapter, bucket, object) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def upload_part(adapter, bucket, object, _upload_id, _part_number) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def upload_part_copy(adapter, dest_bucket, dest_object, _src_bucket, _src_object, _opts) do
    raise "not yet implimented"
    request(adapter, :get, dest_bucket, dest_object)
  end

  def complete_multipart_upload(adapter, bucket, object, _upload_id, _parts) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def abort_multipart_upload(adapter, bucket, object) do
    raise "not yet implimented"
    request(adapter, :get, bucket, object)
  end

  def list_parts(adapter, bucket, object) do
    raise "not yet implimented"
    request(adapter, :ge, bucket, object)
  end

end
