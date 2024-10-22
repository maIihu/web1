﻿using System.Text.Json;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using web1.Helpers;
using web1.Models;

namespace web1.Controllers
{
    public class GioHangController : Controller
    {
        private readonly ILogger<GioHangController> _logger;
        private readonly ShopGiayContext _db;  
        public GioHangController(ShopGiayContext db, ILogger<GioHangController> logger)
        {
            this._db = db;
            _logger = logger;
        }

        public IActionResult GioHang()
        {
            List<CtDonhang> cart = HttpContext.Session.Get<List<CtDonhang>>("Cart") ?? new List<CtDonhang>();
            return View(cart);
        }

        [HttpPost]
        public IActionResult AddToCart(int MaGiay, int Size, int SoLuong)
        {
            var product = _db.Sanphams.FirstOrDefault(p => p.MaGiay == MaGiay);

            if (product != null)
            {
                var cartItem = new CtDonhang
                {
                    MaGiay = product.MaGiay,
                    SoLuong = SoLuong,
                    GiaLucBan = product.GiaBan,
                    ThanhTien = product.GiaBan * SoLuong
                };

                List<CtDonhang> cart = HttpContext.Session.Get<List<CtDonhang>>("Cart") ?? new List<CtDonhang>();

                cart.Add(cartItem);

                HttpContext.Session.Set("Cart", cart);
                return RedirectToAction("GioHang");
            }

            return RedirectToAction("ChiTietGiay", new { maSp = MaGiay });
        }

        [HttpPost]
        public IActionResult RemoveFromCart(int MaGiay, int MaDonHang)
        {
            // Lấy giỏ hàng từ session
            List<CtDonhang> cart = HttpContext.Session.Get<List<CtDonhang>>("Cart") ?? new List<CtDonhang>();

            // Tìm sản phẩm cần xóa và xóa nó
            var itemToRemove = cart.FirstOrDefault(item => item.MaGiay == MaGiay && item.MaDonHang == MaDonHang);
            if (itemToRemove != null)
            {
                cart.Remove(itemToRemove);
            }

            // Lưu lại giỏ hàng vào session
            HttpContext.Session.Set("Cart", cart);

            // Chuyển hướng về trang giỏ hàng
            return RedirectToAction("GioHang");
        }

        [HttpPost]
        public IActionResult Checkout([FromBody] List<CtDonhang> cartItems)
        {
            if (cartItems != null && cartItems.Any())
            {
                // Thực hiện logic thanh toán
                // ...

                // Sau khi thanh toán thành công, xóa hết sản phẩm trong giỏ hàng
                var maDonHang = cartItems.FirstOrDefault()?.MaDonHang;
                if (maDonHang.HasValue)
                {
                    // Xóa hết các sản phẩm của đơn hàng trong CSDL
                    var chiTietDonHangs = _db.CtDonhangs.Where(x => x.MaDonHang == maDonHang.Value).ToList();
                    if (chiTietDonHangs.Any())
                    {
                        _db.CtDonhangs.RemoveRange(chiTietDonHangs);
                        _db.SaveChanges();
                    }
                }

                // Xóa giỏ hàng trong session
                HttpContext.Session.Remove("Cart");

                // Trả về kết quả thành công
                return Json(new { success = true, message = "Thanh toán thành công!" });
            }

            return Json(new { success = false, message = "Có lỗi xảy ra!" });
        }

    }
}
