## index - 共通部分の実装
- 目的: 共通テンプレートを表示できるようにする
- 内容: 
  - ヘッダー: ロゴ + ログインボタン＋ユーザー登録ボタン
  - フッター: 利用規約、プラポリ、問い合わせ先表示
- 関連ファイル：
  - Controller: `app/controllers/home_controller.rb` indexアクションの作成
  - 
- 完了目安
  - TOPページにヘッダーとフッターが表示される

## ユーザー認証状態判定の実装
- 目的: ユーザー登録機能を実装し、ログイン状態によってページの出しわけを可能とする
- 内容:
  - gem 'devise'の導入
  - ルーティングの設定
  - usersテーブルのマイグレーションの設定
  - ログインページの実装
   - ログイン後はマイページ遷移
  - フラッシュメッセージの設定
- 関連ファイル:
  - Model: `app/models/user.rb`
  - Controller: `app/controllers/users_controller.rb` new,create,destroy,session_params
    `app/controllers/sessions_controller.rb` new,create,destroy,session_params
  - View: `app/views/users/new.html.erb`
   - ログインページ： `app/views/sessions/new.html.erb`
   - ヘッダー：`app/views/shared/_header.html.erb`
  - Route: `root "user#new,create"`

## topページ - next nail is...?表示のみ実装
- 目的: TOPページにnextnailコンテンツが表示されるようにする
- 内容:
  - 部分テンプレートの作成(_nextnail.html.erb)
  - 部分テンプレートの追加(index.html.erb)
  - 遷移ボタンの追加
- 関連ファイル:

## topページ - nail log説明コンテンツの表示のみ実装（認証状態対応）
- 目的: TOPページにnail log作成コンテンツが表示されるようにする
- 内容:
  - 部分テンプレートの作成(_aboutnaillog.html.erb)
  - 部分テンプレートの追加(index.html.erb)
  - 認証状態対応のボタン出しわけ（ログイン/新規登録 or nailnote作成ページへのボタン）
- 関連ファイル:

## topページ - 最新投稿5件表示機能の実装
- 目的: TOPページにnail logの最新投稿が表示されるようにする
- 内容:
  - migrationの設定(naillog)
  - 部分テンプレートの作成(_log.html.erb)
  - 部分テンプレートの追加(index.html.erb)
- 関連ファイル:
  - Model
  - Views
  - Controller
  - routes

### nail log - 一覧表示の実装
- 目的: topページから遷移した際に投稿が一覧で表示されるようにする
- 内容: 
  - ルーティングの設定
  - 一覧ページの作成(logs/index.html.erb)
- 関連ファイル:

### ネイルアイテム - 新規登録機能
- 目的: ネイルアイテムを新規登録できるようにする
- 内容: 
  - migrationの設定(nail_itemsなど合計8テーブルほど)
  - 部分テンプレートの実装（一旦はメーカー/商品名/色番号　分のみでOK）(items/_addnail.html.erb)
  - 登録画面の実装(items/new.html.erb)
- 関連ファイル:

### ネイルアイテム - リスト追加機能
- 目的: 登録したアイテムを、所持品として登録できるようにする
- 内容: 
  - migrationの設定(nailstocks)
  - ネイルアイテム新規登録画面にリスト追加ボタン追加(items/_addnail.html.erb)
- 関連ファイル:

### nail log - 投稿機能の実装
- 目的: nail logの投稿機能を実装する
- 内容:
  - ルーティングの設定
  - 部分テンプレートの作成(logs/_form.html.erb)
  - 投稿ページの作成(logs/new.html.erb)
  - フラッシュメッセージの設定
- 関連ファイル:

### nail log - 投稿詳細画面の実装
- 目的: nail logの詳細画面を実装する
- 内容: 
  - ルーティングの設定
  - 詳細ページの作成(logs/show.html.erb)(logs/show#id)
- 関連ファイル:

### nail log - 外部ストレージの設定
- 目的: 画像アップロード時、外部ストレージ(Cloudinary)に保存されるように設定
- 内容:
  - gem Cloudinaryの導入
- 関連ファイル:

### nail log - 画像アップロード機能の実装
- 目的: nail logの投稿機能に画像アップロード機能を実装する
- 内容:
  - モデル、ビューの設定
- 関連ファイル:

### nail log - 投稿をSNSにシェアする機能を実装する
- 目的: nail logの投稿後、投稿をSNSにシェアできるようにする
- 内容:
  - 
- 関連ファイル:

### nail log - 投稿の編集・削除機能の実装
- 目的: 投稿を編集・削除できるようにする
- 内容: 
  - ルーティングの設定
  - 詳細ページの編集(logs/show.html.erb)(logs/show#id)
  - 部分テンプレートの編集(logs/_form.html.erb)
  - フラッシュメッセージの設定
- 関連ファイル:

### nail log - 一覧画面のページネーション
- 目的: nail logの一覧ページ表示時にページネーションが表示されるようにする
- 内容: 
  - gem kaminariの導入
  - ルーティングの設定
  - 一覧ページの作成(logs/index.html.erb)
- 関連ファイル:

## マイページの実装
- 目的: 登録済みユーザーがマイページを見られるようにする
- 内容:
  - マイページを作成する(users/mypage.html.erb)
  - ユーザー登録時の情報を表示する部分テンプレートを作成(users/_profie.html.erb)
  - ユーザーの所持アイテムの部分テンプレートを作成(users/_stocks.html.erb)
  - ユーザーの投稿一覧を表示する部分テンプレートを作成
- 関連ファイル:

## ユーザー情報編集機能の実装
- 目的: 登録済みユーザーが登録情報を編集できるようにする
- 内容: 
  - profile編集画面の作成(users/edit.html.erb)
  - 
- 関連ファイル:

### next nail is...? - ネイルカラー提案機能
- 目的: ネイルカラー提案機能を実装する
- 内容: 
  - ページ作成(nails/index.html.erb)
- 関連ファイル:



## MVPリリース後

### Stock - リスト表示機能
- 目的: 登録したアイテムを、一覧で見られるようにする
- 内容: 
- 関連ファイル:

### ネイルアイテム - Stockから削除機能
- 目的: 登録したアイテムを、Stockから削除できるようにする
- 内容: 
- 関連ファイル:

### ネイルアイテム - マイページに表示する
- 目的: 
- 内容: 
- 関連ファイル:

### next nail is ...? - Stockから提案機能を実装する
- 目的: 
- 内容: 
- 関連ファイル:

### nail log - タグ付け機能を実装する
- 目的: 
- 内容: 
- 関連ファイル:

### nail log - お気に入り機能を実装する
- 目的: 
- 内容: 
- 関連ファイル:

### nail log - 検索機能を実装する
- 目的: 
- 内容: 
- 関連ファイル:

### nail log - 画像をまとめる機能を実装する
- 目的: 
- 内容: 
- 関連ファイル:
