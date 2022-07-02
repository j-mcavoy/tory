defmodule Tory.OctopartTest do
  use Tory.DataCase

  describe "octopart" do
    import Tory.Octopart
    alias Tory.Part.Part

    test "fetch_meta_from_octopart with only mpn works" do
      part = %Part{mpn: "1N914-T50A"}
      {ok?, %{body: body}} = fetch_meta_from_octopart(part)
      assert ok? == :ok
      assert not Map.has_key?(body, :errors)
      IO.inspect(body)
    end

    test "fetch_meta_from_octopart with only octopart_id" do
      part = %Part{octopart_id: "46505370"}
      {ok?, %{body: body}} = fetch_meta_from_octopart(part)
      assert ok? == :ok
      assert not Map.has_key?(body, :errors)
      IO.inspect(body)
    end

    test "fetch_meta_from_octopart with octopart_id and mpn uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, %{body: body}} = fetch_meta_from_octopart(part)
      assert ok? == :ok
      assert not Map.has_key?(body, :errors)
      %{data: %{parts: parts}} = body
      assert length(parts) == 1
      octopart = hd(parts)
      assert part.octopart_id == octopart.id
    end
  end
end
