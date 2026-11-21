# Nhạc theo quà TikTok LIVE

Bảng điều khiển kết nối TikTok LIVE. Khán giả thả quà đúng mốc xu thì phát nhạc bạn đã thêm. Không có game.

## Chạy
1. Cài Node.js LTS (một lần).
2. Bấm đúp `BAT-LIVE.bat` (lần đầu tự cài thư viện 1-3 phút). Trình duyệt mở bảng điều khiển `http://localhost:3007`.
3. TikTok LIVE Studio: thêm nguồn **Link**: `http://lvh.me:3007/?view=stage`. Trang này **chỉ phát nhạc**, không có hình; lần đầu bấm vào trang một lần để trình duyệt cho phát tiếng.
4. Nhập tên TikTok ở bảng điều khiển và bấm **Kết nối**.
5. Chưa live thì bấm **Thả thử** / **x5** ở từng mốc để nghe thử (cần mở `http://localhost:3007/?view=stage` ở một tab).

## Nhạc theo mốc xu
8 mốc: **1, 5, 10, 20, 30, 100, 500, 1000 xu**, mỗi mốc một bài.
- Thêm nhạc: bấm **Chọn nhạc** (mp3/wav/ogg/m4a), hoặc chép file vào `public/music/` đặt tên `1.mp3`, `5.mp3`, ... Có **Nghe thử**, **Xoá**, **Bật** từng mốc.
- Quà phải trùng **đúng mốc** mới phát (không cộng dồn; 2 xu, 15 xu... không phát). Tặng x5 thì phát 5 lần.
- Các bài **xếp hàng**, phát hết bài này mới tới bài kế.
- Mốc có tick **Dừng chờ Tiếp tục** (mặc định 100, 500, 1000 xu): phát xong bài cuối của quà đó thì hàng chờ dừng, bấm **▶ Tiếp tục** mới phát phần còn lại (quà thả lúc đang dừng vẫn xếp hàng chờ).
- Nút **TIẾP TỤC** to ở đầu bảng điều khiển (hoặc bấm phím Cách / Enter), **⏭ Bỏ qua bài**, **🗑 Xoá hàng chờ**.

## Đọc bình luận (mới)
Trang stage đọc bình luận của khán giả thành tiếng, **bỏ qua** (không đọc) bình luận có:
- Từ cấm: tục tĩu, 18+, ma túy, cờ bạc, bạo lực/tự hại, lừa đảo, kéo sang Zalo/Telegram. Bắt cả kiểu viết né: `đ.ị.t`, `d i t`, `sh1t`, `địttt`, `fuuuck`, chèn emoji giữa chữ.
- Link, số điện thoại, bình luận quá dài (spam).
- Tên người gửi có từ cấm thì đọc là "bạn".

Cách dùng:
- Bảng điều khiển → mục **Đọc bình luận**: bật/tắt, bật/tắt đọc tên ("A nói: ..."), **Từ cấm thêm** (mỗi dòng 1 từ, lưu ở `data/doc-cmt.json`, có dấu hay không dấu đều chặn) và ô **Thử câu bình luận** để xem câu nào được đọc.
- Đang phát nhạc thì không đọc cmt; nhạc vào giữa lúc đang đọc thì giọng đọc tự ngắt nhường nhạc.
- Mỗi người cách nhau 8 giây mới được đọc tiếp, cùng 1 câu trong 30 giây chỉ đọc 1 lần, câu chờ quá 20 giây thì bỏ.
- Lớp chặn thứ 2 nằm ở server (`/api/tts`) và ở `voice.say`: dù chỗ nào quên lọc, câu có từ cấm vẫn không ra tiếng.
- Danh sách có sẵn ở `src/live/bannedWords.ts`. Chữ viết quá sáng tạo vẫn có thể lọt: gặp từ nào lọt thì thêm vào ô **Từ cấm thêm**.

## Cấu trúc
`server.ts` (kết nối TikTok, gửi sự kiện, API nhạc), `src/live/MusicPanel.tsx` (bảng nhạc), `src/live/music.ts` (hàng chờ phát), `src/live/MusicStage.tsx` (trang stage), `src/live/commentReader.ts` + `commentFilter.ts` + `bannedWords.ts` (đọc và lọc bình luận), `src/live/CommentPanel.tsx` (bảng đọc cmt).
