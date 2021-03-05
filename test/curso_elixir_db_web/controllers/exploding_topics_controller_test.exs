defmodule CursoElixirDbWeb.ExplodingTopicsControllerTest do
  # use CursoElixirDbWeb.ConnCase

  # alias CursoElixirDb.HelperExplodingTopics

  # @create_attrs %{description: "some description", growth: "some growth", searches: "some searches", titles: "some titles"}
  # @update_attrs %{description: "some updated description", growth: "some updated growth", searches: "some updated searches", titles: "some updated titles"}
  # @invalid_attrs %{description: nil, growth: nil, searches: nil, titles: nil}

  # def fixture(:exploding_topics) do
  #   {:ok, exploding_topics} = HelperExplodingTopics.create_exploding_topics(@create_attrs)
  #   exploding_topics
  # end

  # describe "index" do
  #   test "lists all exploding_topics", %{conn: conn} do
  #     conn = get(conn, Routes.exploding_topics_path(conn, :index))
  #     assert html_response(conn, 200) =~ "Listing Exploding topics"
  #   end
  # end

  # describe "new exploding_topics" do
  #   test "renders form", %{conn: conn} do
  #     conn = get(conn, Routes.exploding_topics_path(conn, :new))
  #     assert html_response(conn, 200) =~ "New Exploding topics"
  #   end
  # end

  # describe "create exploding_topics" do
  #   test "redirects to show when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.exploding_topics_path(conn, :create), exploding_topics: @create_attrs)

  #     assert %{id: id} = redirected_params(conn)
  #     assert redirected_to(conn) == Routes.exploding_topics_path(conn, :show, id)

  #     conn = get(conn, Routes.exploding_topics_path(conn, :show, id))
  #     assert html_response(conn, 200) =~ "Show Exploding topics"
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.exploding_topics_path(conn, :create), exploding_topics: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "New Exploding topics"
  #   end
  # end

  # describe "edit exploding_topics" do
  #   setup [:create_exploding_topics]

  #   test "renders form for editing chosen exploding_topics", %{conn: conn, exploding_topics: exploding_topics} do
  #     conn = get(conn, Routes.exploding_topics_path(conn, :edit, exploding_topics))
  #     assert html_response(conn, 200) =~ "Edit Exploding topics"
  #   end
  # end

  # describe "update exploding_topics" do
  #   setup [:create_exploding_topics]

  #   test "redirects when data is valid", %{conn: conn, exploding_topics: exploding_topics} do
  #     conn = put(conn, Routes.exploding_topics_path(conn, :update, exploding_topics), exploding_topics: @update_attrs)
  #     assert redirected_to(conn) == Routes.exploding_topics_path(conn, :show, exploding_topics)

  #     conn = get(conn, Routes.exploding_topics_path(conn, :show, exploding_topics))
  #     assert html_response(conn, 200) =~ "some updated description"
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, exploding_topics: exploding_topics} do
  #     conn = put(conn, Routes.exploding_topics_path(conn, :update, exploding_topics), exploding_topics: @invalid_attrs)
  #     assert html_response(conn, 200) =~ "Edit Exploding topics"
  #   end
  # end

  # describe "delete exploding_topics" do
  #   setup [:create_exploding_topics]

  #   test "deletes chosen exploding_topics", %{conn: conn, exploding_topics: exploding_topics} do
  #     conn = delete(conn, Routes.exploding_topics_path(conn, :delete, exploding_topics))
  #     assert redirected_to(conn) == Routes.exploding_topics_path(conn, :index)
  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.exploding_topics_path(conn, :show, exploding_topics))
  #     end
  #   end
  # end

  # defp create_exploding_topics(_) do
  #   exploding_topics = fixture(:exploding_topics)
  #   %{exploding_topics: exploding_topics}
  # end
end
