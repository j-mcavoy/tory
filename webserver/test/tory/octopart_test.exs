defmodule Tory.OctopartTest do
  use Tory.DataCase

  describe "octopart" do
    import Tory.Octopart
    alias Tory.Part.Part
    alias Tory.Octopart.Api.PartResult

    test "fetch_meta_from_octopart with only mpn works" do
      part = %Part{mpn: "1N914-T50A"}
      {ok?, [%PartResult{}] = results} = fetch_meta_from_octopart(part)
      assert ok? == :ok
    end

    test "fetch_meta_from_octopart with only octopart_id" do
      part = %Part{octopart_id: "46505370"}
      {ok?, [%PartResult{}] = results} = fetch_meta_from_octopart(part)
      assert ok? == :ok
    end

    test "fetch_meta_from_octopart with octopart_id and mpn uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, [%PartResult{}] = results} = fetch_meta_from_octopart(part)
      assert ok? == :ok
      assert length(results) == 1
      assert part.octopart_id == hd(results).id
    end
  end
end
