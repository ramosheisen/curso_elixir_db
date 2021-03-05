defmodule Exercise1 do

  import CursoElixirDb.HelperExplodingTopics

  alias CursoElixirDb.HelperExplodingTopics.ExplodingTopics

  def exercise do
    service = HTTPoison.get("https://explodingtopics.com/")

    case service do
      {:ok, %HTTPoison.Response{ status_code: 200, body: body }} ->
        {:ok, document} = Floki.parse_document(body)

        container = Floki.find(document, "div.topicInfoContainer")

        titles = for n <- Floki.find(container, "div.tileKeyword"), do: n |> Floki.text
        description = for n <- Floki.find(container, "div.tileDescription"), do: n |> Floki.text
        searches = for n <- Floki.find(container, "div.scoreTagItem"), do: n |> Floki.text
        growth = for n <- Floki.find(container, "div.scoreTagGradient"), do: n |> Floki.text

        Enum.zip([titles, description, searches, growth])
        |> Enum.map(fn {titles, description, searches, growth} ->
          case find_exploding_topics_by_title(titles) do
            %ExplodingTopics{} = et -> update_exploding_topics(et, %{searches: searches, growth: growth})
            _ -> create_exploding_topics(%{
                titles: titles, description: description, searches: searches, growth: growth
              })
            # _ -> Registry.create(Registry, %{
            #     titles: titles, description: description, searches: searches, growth: growth
            #   })
          end
        end)

      {:ok, %HTTPoison.Response{ status_code: 404 }} ->
        IO.puts "No se encuentra la url"
      {:error, %HTTPoison.Error{ reason: reason }} ->
        IO.inspect(reason, label: "--------------->")
    end
  end

end
