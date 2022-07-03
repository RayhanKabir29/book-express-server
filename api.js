const client = require("./connection.js");
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const port = 5000;

app.use(bodyParser.json());
//View all User
app.get("/users", async (req, res) => {
  await client.query(`Select * from users`, (err, result) => {
    if (!err) {
      res.send(result.rows);
    } else {
      console.log("Error Loading");
    }
  });
  client.end;
});
//Add new User
app.post("/users", async (req, res) => {
  const user = req.body;
  let insertUser =
    await `insert into users ( user_name, email, full_name, password)
                    values( '${user.user_name}','${user.email}','${user.full_name}','${user.password}')`;
  client.query(insertUser, (err, result) => {
    if (!err) {
      res.send("Insert user successfully");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

//View all Books
app.get("/books", async (req, res) => {
  await client.query(`select * from books`, (err, result) => {
    if (!err) {
      res.send(result.rows);
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

app.get("/user/bookList", async (req, res) => {
  await client.query(
    `select user_name, email , books.book_name, books.category from users
     left JOIN books on books.author_id= users.id`,
    (err, result) => {
      if (!err) {
        res.send(result.rows);
      } else {
        console.log(err.message);
      }
    }
  );
  client.end;
});
//A user can check the list of books he owns
app.get("/user/bookList/:id", async (req, res) => {
  const id = req.params.id;
  await client.query(
    `select user_name, books.book_name from users
    left JOIN books on books.author_id=users.id where author_id =${id}`,
    (err, result) => {
      if (!err) {
        res.send(result.rows);
      } else {
        console.log(err.message);
      }
    }
  );
  client.end;
});

//View the shared book
app.get("/bookList/shared/:id", async (req, res) => {
  const id = req.params.id;
  await client.query(
    `SELECT users.user_name, books.book_name from shared_book 
  LEFT JOIN books on books.id = shared_book.book_id
  LEFT JOIN users on users.id = shared_book.author_id
  WHERE shared_book.author_id = ${id}`,
    (err, result) => {
      if (!err) {
        res.send(result.rows);
      } else {
        console.log(err.message);
      }
    }
  );
  client.end;
});

//view the book someone shared
app.get("/bookList/sharedBy/:id", async (req, res) => {
  const id = req.params.id;
  await client.query(
    `SELECT users.user_name, books.book_name from shared_book 
      LEFT JOIN books on books.id = shared_book.book_id
      LEFT JOIN users on users.id = shared_book.author_id
      WHERE shared_book.shared_user = ${id}`,
    (err, result) => {
      if (!err) {
        res.send(result.rows);
      } else {
        console.log(err.message);
      }
    }
  );
  client.end;
});

//Add a new Book

app.post("/books", async (req, res) => {
  const book = req.body;
  let insertBook = await `insert into books (book_name, author_id, category)
                    values( '${book.book_name}',${book.author_id},'${book.category}')`;
  console.log(insertBook);
  client.query(insertBook, (err, result) => {
    if (!err) {
      res.send("Insert book successfully");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

//Update User

app.put("/users/:id", async (req, res) => {
  const user = req.body;
  const updateQuery = await `update users
                     set user_name = '${user.user_name}',
                     email = '${user.email}',
                     full_name = '${user.full_name}',
                     password = '${user.password}'
                     where id = ${user.id}`;

  client.query(updateQuery, (err, result) => {
    if (!err) {
      res.send("Update was successful");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

//Update Book
app.put("/books/:id", async (req, res) => {
  const book = req.body;
  const updateQuery = await `update books
                     set book_name = '${book.book_name}',
                     category = '${book.category}',
                     where id = ${book.id}`;

  client.query(updateQuery, (err, result) => {
    if (!err) {
      res.send("Update was successful");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

//Delete a User
app.delete("/users/:id", async (req, res) => {
  const userId = req.params.id;
  let insertQuery = await `delete from users where id=${userId}`;

  client.query(insertQuery, (err, result) => {
    if (!err) {
      res.send("Deletion was successful");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

//Delete Book
app.delete("/books/:id", async (req, res) => {
  const userId = req.params.id;

  await client.query(`delete from books where id=${userId}`, (err, result) => {
    if (!err) {
      res.send("Deletion was successful");
    } else {
      console.log(err.message);
    }
  });
  client.end;
});

app.listen(port, () => {
  console.log(`Listening from ${port}`);
});
client.connect();
