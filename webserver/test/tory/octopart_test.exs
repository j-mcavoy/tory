defmodule Tory.OctopartTest do
  use Tory.DataCase

  import Tory.Octopart
  alias Tory.Part.Part
  alias Tory.Octopart.Api.PartResult
  alias Tory.OctopartFixtures

  describe "octopart searching" do
    @tag api: true
    test "search_octopart with only mpn works" do
      part = %Part{mpn: "1N914-T50A"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
    end

    @tag api: true
    test "search_octopart with only mpn w/ limit works" do
      part = %Part{mpn: "1"}
      limit = 3
      {ok?, results} = search_octopart(part, limit)
      assert ok? == :ok
      assert(length(results) == limit)
    end

    @tag api: true
    test "search_octopart with only octopart_id" do
      part = %Part{octopart_id: "46505370"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
    end

    @tag api: true
    test "search_octopart with octopart_id and mpn uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
      assert length(results) == 1
      assert part.octopart_id == hd(results).id
    end

    @tag api: true
    test "search_octopart with octopart_id and mpn w/ limit uses octopart_id" do
      part = %Part{mpn: "1N914-T50A", octopart_id: "46505370"}
      {ok?, results} = search_octopart(part)
      assert ok? == :ok
      assert length(results) == 1
      assert part.octopart_id == hd(results).id
    end
  end

  describe "octopart parsing" do
    test "parse part" do
      part = parse_part_result(OctopartFixtures.part_result_fixture(), 1)
    end
  end

  describe "octopart insert" do
    @tag insert: true
    @tag api: true
    test "insert part_result" do
      part = Tory.PartFixtures.part_fixture()
      {:ok, [result | _]} = search_octopart(part, 1)
      insert_part_result(result, part)
    end
  end

  describe "ParseResult into_map should strip all nested structs in part result" do
    pr = Tory.PartResultFixtures.part_result_fixture()
    pr_map = PartResult.into_map(pr)
    expected = Tory.PartResultFixtures.part_result_map_fixture()
    IO.inspect(MapDiff.diff(pr_map, expected), limit: :infinity)
    assert pr_map == expected
  end
end
