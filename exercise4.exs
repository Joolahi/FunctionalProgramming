#Part 1

defmodule ColorsConverter do
  def colors() do
      color = %{
      "black" =>"#000000",
      "white" =>"#FFFFFF",
      "red"   =>"#FF0000",
      "aqua"=>"#00FFFF",
      "blue"  =>"#0000FF",
      "yellow"=>"#FFFF00",
      "green" =>"#008000",
      "orange"=>"#FFA500",
      "brown" =>"#A52A2A",
      "beige"  =>"#F5FDC",

      "#000000"=>"black" ,
      "#FFFFFF"=>"white" ,
      "#FF0000"=>"red",
      "#00FFFF"=>"aqua",
      "#0000FF"=>"blue",
      "#FFFF00"=>"yellow",
      "#008000"=>"green" ,
      "#FFA500"=>"orange",
      "#A52A2A"=>"brown" ,
      "#F5F5DC"=>"beige"
    }

      input = String.trim(IO.gets "input color: ")

      if(color[input] != nil) do
      IO.puts color[input]
          colors()
      end
  end
end
ColorsConverter.colors()

#Part 2
defmodule Library do
  def booksLoop(books) do
    input = String.trim(IO.gets "Type command (list, search, add, remove, quit): ")

    case input do
      "list" -> Library.list(books)
      "search" -> Library.search(books)
      "add" -> Library.add(books)
      "remove" -> Library.remove(books)
      "quit" -> :ok
    end
  end

  def list(books) do
    booksname = Map.values(books)
    IO.puts(booksname)
    booksLoop(books)
  end

  def search(books) do
    value = String.trim(IO.gets "Search book name with ISBN: ")
    IO.puts books[value]
    booksLoop(books)
  end

  def add(books) do
    value = String.trim(IO.gets "New ISBN: ")
    name = String.trim(IO.gets "New name: ")
    books = Map.put(books, value, name)
    booksLoop(books)
  end

  def remove(books) do
    value = String.trim(IO.gets "Remove book with ISBN: ")
    books = Map.delete(books, value)
    booksLoop(books)
  end

  def quit do
    IO.puts "Bye!"
  end
end

Library.booksLoop(
  %{
    "9781400079988" => "War and peace ",
    "9789176056745" => "The Waves ",
    "9781524796297" => "Fire & Blood ",
    "9789510490235" => "Pienen rakettimiehen maa ",
    "9789523736238" => "IKE ",
  }
)
