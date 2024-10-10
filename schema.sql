CREATE TABLE TODOS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id TEXT NOT NULL, -- This will be obtained from the external service
    title TEXT NOT NULL,
    url TEXT,
    status TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TASK_SESSIONS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    task_id INTEGER NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT,
    duration INTEGER,
    FOREIGN KEY(task_id) REFERENCES TODOS(id) ON DELETE CASCADE
);
