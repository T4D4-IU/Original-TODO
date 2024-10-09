CREATE TABLE user_datas (
    user_id TEXT PRIMARY KEY,
    user_name TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE todos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    url TEXT,
    status TEXT CHECK(status IN ('todo', 'in_progress', 'completed')) NOT NULL DEFAULT 'todo',
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE task_sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    task_id INTEGER NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT,
    duration INTEGER, -- 秒単位で保存
    FOREIGN KEY (task_id) REFERENCES tasks(id)
)
