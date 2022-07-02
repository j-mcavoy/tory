defmodule Tory.OctopartTest do
  use Tory.DataCase

  describe "octopart" do
    import Tory.Octopart
    alias Tory.Part.Part
    alias Tory.Octopart.Api.PartResult

    test "search_octopart with only mpn works" do
      part = %Part{mpn: "1N914-T50A"}
      {ok?, [%PartResult{}] = results} = search_octopart(part)
      assert ok? == :ok
    end

    test "search_octopart with only mpn w/ limit works" do
      part = %Part{mpn: "1"}
      limit = 3
      {ok?, results} = search_octopart(part, limit)
      assert ok? == :ok
      assert(length(results) == limit)
    end

    test "search_octopart with only octopart_id" do
      part = %Part{octopart_id: "46505370"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
    end

    test "search_octopart with octopart_id and mpn uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
      assert length(results) == 1
      assert part.octopart_id == hd(results).id
    end

    test "search_octopart with octopart_id and mpn w/ limit uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, [%PartResult{}] = results} = search_octopart(part)
      assert ok? == :ok
      assert length(results) == 1
      assert part.octopart_id == hd(results).id
    end
  end
end
