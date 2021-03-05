defmodule CursoElixirDb.HelperExplodingTopicsTest do
  use CursoElixirDb.DataCase

  alias CursoElixirDb.HelperExplodingTopics

  describe "exploding_topics" do
    alias CursoElixirDb.HelperExplodingTopics.ExplodingTopics

    @valid_attrs %{description: "some description", email: "some email", growth: "some growth", searches: "some searches", titles: "some titles"}
    @update_attrs %{description: "some updated description", email: "some updated email", growth: "some updated growth", searches: "some updated searches", titles: "some updated titles"}
    @invalid_attrs %{description: nil, email: nil, growth: nil, searches: nil, titles: nil}

    def exploding_topics_fixture(attrs \\ %{}) do
      {:ok, exploding_topics} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HelperExplodingTopics.create_exploding_topics()

      exploding_topics
    end

    test "list_exploding_topics/0 returns all exploding_topics" do
      exploding_topics = exploding_topics_fixture()
      assert HelperExplodingTopics.list_exploding_topics() == [exploding_topics]
    end

    test "get_exploding_topics!/1 returns the exploding_topics with given id" do
      exploding_topics = exploding_topics_fixture()
      assert HelperExplodingTopics.get_exploding_topics!(exploding_topics.id) == exploding_topics
    end

    test "create_exploding_topics/1 with valid data creates a exploding_topics" do
      assert {:ok, %ExplodingTopics{} = exploding_topics} = HelperExplodingTopics.create_exploding_topics(@valid_attrs)
      assert exploding_topics.description == "some description"
      #assert exploding_topics.email == "some email"
      assert exploding_topics.growth == "some growth"
      assert exploding_topics.searches == "some searches"
      assert exploding_topics.titles == "some titles"
    end

    test "create_exploding_topics/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HelperExplodingTopics.create_exploding_topics(@invalid_attrs)
    end

    # test "update_exploding_topics/2 with valid data updates the exploding_topics" do
    #   exploding_topics = exploding_topics_fixture()
    #   assert {:ok, %ExplodingTopics{} = exploding_topics} = HelperExplodingTopics.update_exploding_topics(exploding_topics, @update_attrs)
    #   assert exploding_topics.description == "some updated description"
    #   assert exploding_topics.email == "some updated email"
    #   assert exploding_topics.growth == "some updated growth"
    #   assert exploding_topics.searches == "some updated searches"
    #   assert exploding_topics.titles == "some updated titles"
    # end

    test "update_exploding_topics/2 with invalid data returns error changeset" do
      exploding_topics = exploding_topics_fixture()
      assert {:error, %Ecto.Changeset{}} = HelperExplodingTopics.update_exploding_topics(exploding_topics, @invalid_attrs)
      assert exploding_topics == HelperExplodingTopics.get_exploding_topics!(exploding_topics.id)
    end

    test "delete_exploding_topics/1 deletes the exploding_topics" do
      exploding_topics = exploding_topics_fixture()
      assert {:ok, %ExplodingTopics{}} = HelperExplodingTopics.delete_exploding_topics(exploding_topics)
      assert_raise Ecto.NoResultsError, fn -> HelperExplodingTopics.get_exploding_topics!(exploding_topics.id) end
    end

    test "change_exploding_topics/1 returns a exploding_topics changeset" do
      exploding_topics = exploding_topics_fixture()
      assert %Ecto.Changeset{} = HelperExplodingTopics.change_exploding_topics(exploding_topics)
    end
  end
end
