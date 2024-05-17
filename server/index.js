import pg from "pg";

const {Client} = pg;

const client = new Client({
  connectionString: "postgres://root:root@localhost:5432/practice_db",
});

await client.connect();

const res = await client.query(`SELECT * FROM customers_sumary`);

await client.end();

console.log(res.rows);
