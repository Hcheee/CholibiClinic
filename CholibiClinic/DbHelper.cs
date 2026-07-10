using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Collections.Generic;
using System.Linq;

namespace CholibiClinic
{
    public static class DbHelper
    {
        private static string connString = ConfigurationManager.ConnectionStrings["ClinicDB"]?.ConnectionString;

        // Trạng thái dùng Mock Data
        private static bool ShouldUseMock()
        {
            if (HttpContext.Current.Session == null) return true;
            if (HttpContext.Current.Session["UseMockData"] != null && (bool)HttpContext.Current.Session["UseMockData"])
            {
                return true;
            }

            // Thử kết nối CSDL nhanh, nếu lỗi sẽ đặt UseMockData = true
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    return false;
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return true;
            }
        }

        // Khởi tạo Mock Data mẫu trong Session
        public static void InitMockData()
        {
            var session = HttpContext.Current.Session;
            if (session == null) return;

            // 1. Chuyên khoa
            if (session["MockSpecialties"] == null)
            {
                var dt = new DataTable();
                dt.Columns.Add("SpecialtyId", typeof(int));
                dt.Columns.Add("SpecialtyName", typeof(string));

                dt.Rows.Add(1, "Nội tổng quát");
                dt.Rows.Add(2, "Tim mạch");
                dt.Rows.Add(3, "Nhi khoa");
                dt.Rows.Add(4, "Da liễu");
                dt.Rows.Add(5, "Tai mũi họng");

                session["MockSpecialties"] = dt;
            }

            // 2. Bác sĩ
            if (session["MockDoctors"] == null)
            {
                var dt = new DataTable();
                dt.Columns.Add("DoctorId", typeof(int));
                dt.Columns.Add("DoctorName", typeof(string));
                dt.Columns.Add("Phone", typeof(string));
                dt.Columns.Add("Email", typeof(string));
                dt.Columns.Add("SpecialtyId", typeof(int));
                dt.Columns.Add("SpecialtyName", typeof(string));

                dt.Rows.Add(1, "Nguyễn Văn A", "0988888888", "doctor1@gmail.com", 1, "Nội tổng quát");
                dt.Rows.Add(2, "Trần Thị B", "0977777777", "doctor2@gmail.com", 2, "Tim mạch");
                dt.Rows.Add(3, "Lê Hồng C", "0966666666", "doctor3@gmail.com", 3, "Nhi khoa");
                dt.Rows.Add(4, "Dr.Test", "8412345986", "test1@gmail.com", 1, "Nội tổng quát");
                dt.Rows.Add(5, "Phạm Minh D", "0955555555", "doctor5@gmail.com", 4, "Da liễu");
                dt.Rows.Add(6, "Hoàng Thảo E", "0944444444", "doctor6@gmail.com", 5, "Tai mũi họng");

                session["MockDoctors"] = dt;
            }

            // 3. Người dùng
            if (session["MockUsers"] == null)
            {
                var dt = new DataTable();
                dt.Columns.Add("UserId", typeof(int));
                dt.Columns.Add("FullName", typeof(string));
                dt.Columns.Add("Email", typeof(string));
                dt.Columns.Add("Password", typeof(string));
                dt.Columns.Add("Phone", typeof(string));
                dt.Columns.Add("Gender", typeof(string));
                dt.Columns.Add("BirthDate", typeof(DateTime));
                dt.Columns.Add("Address", typeof(string));
                dt.Columns.Add("Role", typeof(string));

                dt.Rows.Add(1, "Administrator", "admin@gmail.com", "123456", "0123456789", "Nam", new DateTime(2003, 1, 1), "Hà Nội", "Admin");


                session["MockUsers"] = dt;
            }

            // 4. Lịch hẹn
            if (session["MockAppointments"] == null)
            {
                var dt = new DataTable();
                dt.Columns.Add("AppointmentId", typeof(int));
                dt.Columns.Add("UserId", typeof(int));
                dt.Columns.Add("DoctorId", typeof(int));
                dt.Columns.Add("DoctorName", typeof(string));
                dt.Columns.Add("SpecialtyName", typeof(string));
                dt.Columns.Add("AppointmentDate", typeof(DateTime));
                dt.Columns.Add("AppointmentTime", typeof(TimeSpan));
                dt.Columns.Add("Status", typeof(string));
                dt.Columns.Add("Notes", typeof(string));

                // Thêm một số lịch hẹn mẫu
                dt.Rows.Add(1, 2, 1, "Nguyễn Văn A", "Nội tổng quát", DateTime.Today.AddDays(1), new TimeSpan(9, 0, 0), "Chờ khám", "Đau đầu nhẹ");
                dt.Rows.Add(2, 2, 2, "Trần Thị B", "Tim mạch", DateTime.Today.AddDays(-2), new TimeSpan(14, 30, 0), "Đã khám", "Khám định kỳ");

                session["MockAppointments"] = dt;
            }
        }

        // Lấy danh sách chuyên khoa
        public static DataTable GetSpecialties()
        {
            if (ShouldUseMock())
            {
                return (DataTable)HttpContext.Current.Session["MockSpecialties"];
            }

            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT SpecialtyId, SpecialtyName FROM Specialties ORDER BY SpecialtyName ASC";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return (DataTable)HttpContext.Current.Session["MockSpecialties"];
            }
            return dt;
        }

        // Lấy danh sách bác sĩ (có thể lọc theo SpecialtyId)
        public static DataTable GetDoctors(int? specialtyId = null)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockDoctors"];
                if (specialtyId.HasValue && specialtyId.Value > 0)
                {
                    var dv = new DataView(mockDt);
                    dv.RowFilter = $"SpecialtyId = {specialtyId.Value}";
                    return dv.ToTable();
                }
                return mockDt;
            }

            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                        SELECT d.DoctorId, d.DoctorName, d.Phone, d.Email, d.SpecialtyId, s.SpecialtyName
                        FROM Doctors d
                        LEFT JOIN Specialties s ON d.SpecialtyId = s.SpecialtyId";
                    if (specialtyId.HasValue && specialtyId.Value > 0)
                    {
                        query += " WHERE d.SpecialtyId = @SpecialtyId";
                    }
                    query += " ORDER BY d.DoctorName ASC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (specialtyId.HasValue && specialtyId.Value > 0)
                        {
                            cmd.Parameters.AddWithValue("@SpecialtyId", specialtyId.Value);
                        }
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return GetDoctors(specialtyId);
            }
            return dt;
        }

        // Lấy danh sách lịch hẹn của một User
        public static DataTable GetAppointments(int userId)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockAppointments"];
                var dv = new DataView(mockDt);
                dv.RowFilter = $"UserId = {userId}";
                dv.Sort = "AppointmentDate DESC, AppointmentTime DESC";
                return dv.ToTable();
            }

            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                        SELECT a.AppointmentId, a.UserId, a.DoctorId, d.DoctorName, s.SpecialtyName,
                               a.AppointmentDate, a.AppointmentTime, a.Status
                        FROM Appointments a
                        INNER JOIN Doctors d ON a.DoctorId = d.DoctorId
                        LEFT JOIN Specialties s ON d.SpecialtyId = s.SpecialtyId
                        WHERE a.UserId = @UserId
                        ORDER BY a.AppointmentDate DESC, a.AppointmentTime DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return GetAppointments(userId);
            }
            return dt;
        }

        // Thêm lịch hẹn mới
        public static bool AddAppointment(int userId, int doctorId, DateTime date, TimeSpan time, string notes)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockAppointments"];
                DataTable mockDoc = (DataTable)HttpContext.Current.Session["MockDoctors"];

                // Tìm tên bác sĩ & chuyên khoa
                string docName = "Bác sĩ";
                string specName = "Tổng quát";
                var docRow = mockDoc.AsEnumerable().FirstOrDefault(r => r.Field<int>("DoctorId") == doctorId);
                if (docRow != null)
                {
                    docName = docRow.Field<string>("DoctorName");
                    specName = docRow.Field<string>("SpecialtyName");
                }

                int newId = 1;
                if (mockDt.Rows.Count > 0)
                {
                    newId = mockDt.AsEnumerable().Max(r => r.Field<int>("AppointmentId")) + 1;
                }

                mockDt.Rows.Add(newId, userId, doctorId, docName, specName, date, time, "Chờ khám", notes);
                HttpContext.Current.Session["MockAppointments"] = mockDt;
                return true;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                        INSERT INTO Appointments (UserId, DoctorId, AppointmentDate, AppointmentTime, Status)
                        VALUES (@UserId, @DoctorId, @AppointmentDate, @AppointmentTime, @Status)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                        cmd.Parameters.AddWithValue("@AppointmentDate", date.Date);
                        cmd.Parameters.AddWithValue("@AppointmentTime", time);
                        cmd.Parameters.AddWithValue("@Status", "Chờ khám");

                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows > 0;
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return AddAppointment(userId, doctorId, date, time, notes);
            }
        }

        // Hủy lịch hẹn
        public static bool CancelAppointment(int appointmentId)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockAppointments"];
                var row = mockDt.AsEnumerable().FirstOrDefault(r => r.Field<int>("AppointmentId") == appointmentId);
                if (row != null)
                {
                    row["Status"] = "Đã hủy";
                    HttpContext.Current.Session["MockAppointments"] = mockDt;
                    return true;
                }
                return false;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "UPDATE Appointments SET Status = N'Đã hủy' WHERE AppointmentId = @AppointmentId";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@AppointmentId", appointmentId);
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows > 0;
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return CancelAppointment(appointmentId);
            }
        }

        // Đăng nhập người dùng
        public static DataTable LoginUser(string email, string password)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockUsers"];
                var rows = mockDt.AsEnumerable()
                    .Where(r => r.Field<string>("Email").Equals(email, StringComparison.OrdinalIgnoreCase)
                             && r.Field<string>("Password") == password);

                if (rows.Any())
                {
                    return rows.CopyToDataTable();
                }
                return null;
            }

            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT UserId, FullName, Email, Role FROM Users WHERE Email = @Email AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email.Trim());
                        cmd.Parameters.AddWithValue("@Password", password);
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
                if (dt.Rows.Count > 0) return dt;
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return LoginUser(email, password);
            }
            return null;
        }

        // Đăng ký người dùng mới
        public static bool RegisterUser(string fullName, string email, string password, string phone, string gender, DateTime birthDate, string address)
        {
            if (ShouldUseMock())
            {
                DataTable mockDt = (DataTable)HttpContext.Current.Session["MockUsers"];
                bool exists = mockDt.AsEnumerable().Any(r => r.Field<string>("Email").Equals(email, StringComparison.OrdinalIgnoreCase));
                if (exists) return false;

                int newId = mockDt.AsEnumerable().Max(r => r.Field<int>("UserId")) + 1;
                mockDt.Rows.Add(newId, fullName, email, password, phone, gender, birthDate, address, "user");
                HttpContext.Current.Session["MockUsers"] = mockDt;
                return true;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand cmdCheck = new SqlCommand(checkQuery, conn))
                    {
                        cmdCheck.Parameters.AddWithValue("@Email", email.Trim());
                        conn.Open();
                        int count = (int)cmdCheck.ExecuteScalar();
                        if (count > 0) return false;
                        conn.Close();
                    }

                    string query = @"
                        INSERT INTO Users (FullName, Email, Password, Phone, Gender, BirthDate, Address, Role)
                        VALUES (@FullName, @Email, @Password, @Phone, @Gender, @BirthDate, @Address, 'user')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName.Trim());
                        cmd.Parameters.AddWithValue("@Email", email.Trim());
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Phone", phone.Trim());
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@BirthDate", birthDate.Date);
                        cmd.Parameters.AddWithValue("@Address", address.Trim());

                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        return rows > 0;
                    }
                }
            }
            catch (Exception)
            {
                HttpContext.Current.Session["UseMockData"] = true;
                InitMockData();
                return RegisterUser(fullName, email, password, phone, gender, birthDate, address);
            }
        }
        public static int GetDoctorIdByEmail(string email)
        {
            if (ShouldUseMock())
            {
                DataTable dt = (DataTable)HttpContext.Current.Session["MockDoctors"];

                var row = dt.AsEnumerable()
                    .FirstOrDefault(r => r.Field<string>("Email")
                    .Equals(email, StringComparison.OrdinalIgnoreCase));

                if (row != null)
                    return row.Field<int>("DoctorId");

                return 0;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT DoctorId FROM Doctors WHERE Email=@Email";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();

                object obj = cmd.ExecuteScalar();

                if (obj == null)
                    return 0;

                return Convert.ToInt32(obj);
            }
        }

        public static DataTable GetAppointmentsByDoctor(int doctorId)
        {
            if (ShouldUseMock())
            {
                DataTable dt = (DataTable)HttpContext.Current.Session["MockAppointments"];

                DataView dv = new DataView(dt);
                dv.RowFilter = "DoctorId = " + doctorId;
                dv.Sort = "AppointmentDate DESC, AppointmentTime DESC";

                return dv.ToTable();
            }

            DataTable table = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"
        SELECT a.AppointmentId,
               a.UserId,
               u.FullName,
               d.DoctorName,
               s.SpecialtyName,
               a.AppointmentDate,
               a.AppointmentTime,
               a.Status
        FROM Appointments a
        INNER JOIN Users u ON a.UserId=u.UserId
        INNER JOIN Doctors d ON a.DoctorId=d.DoctorId
        LEFT JOIN Specialties s ON d.SpecialtyId=s.SpecialtyId
        WHERE a.DoctorId=@DoctorId
        ORDER BY AppointmentDate DESC";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@DoctorId", doctorId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(table);
            }

            return table;
        }
        public static DataTable GetAllAppointments()
        {
            if (ShouldUseMock())
            {
                return (DataTable)HttpContext.Current.Session["MockAppointments"];
            }

            DataTable table = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"
        SELECT a.AppointmentId,
               u.FullName,
               d.DoctorName,
               s.SpecialtyName,
               a.AppointmentDate,
               a.AppointmentTime,
               a.Status
        FROM Appointments a
        INNER JOIN Users u ON a.UserId=u.UserId
        INNER JOIN Doctors d ON a.DoctorId=d.DoctorId
        LEFT JOIN Specialties s ON d.SpecialtyId=s.SpecialtyId
        ORDER BY AppointmentDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(sql, conn);

                da.Fill(table);
            }

            return table;
        }

        public static bool DeleteDoctor(int doctorId)
        {
            string connString = ConfigurationManager.ConnectionStrings["ClinicDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Kiểm tra bác sĩ có lịch khám hay không
                string checkSql = "SELECT COUNT(*) FROM Appointments WHERE DoctorId = @DoctorId";

                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@DoctorId", doctorId);

                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        // Có lịch khám -> không cho xóa
                        return false;
                    }
                }

                // Không có lịch khám thì xóa
                string deleteSql = "DELETE FROM Doctors WHERE DoctorId = @DoctorId";

                using (SqlCommand deleteCmd = new SqlCommand(deleteSql, conn))
                {
                    deleteCmd.Parameters.AddWithValue("@DoctorId", doctorId);

                    return deleteCmd.ExecuteNonQuery() > 0;
                }
            }
        }
        public static bool AddDoctor(string doctorName,
                             string phone,
                             string email,
                             int specialtyId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"
        INSERT INTO Doctors
        (
            DoctorName,
            Phone,
            Email,
            SpecialtyId
        )
        VALUES
        (
            @DoctorName,
            @Phone,
            @Email,
            @SpecialtyId
        )";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@DoctorName", doctorName);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@SpecialtyId", specialtyId);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public static bool UpdateDoctor(int doctorId,
                                string doctorName,
                                string phone,
                                string email,
                                int specialtyId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"
        UPDATE Doctors
        SET DoctorName=@DoctorName,
            Phone=@Phone,
            Email=@Email,
            SpecialtyId=@SpecialtyId
        WHERE DoctorId=@DoctorId";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                cmd.Parameters.AddWithValue("@DoctorName", doctorName);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@SpecialtyId", specialtyId);

                conn.Open();

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public static DataTable GetDoctorById(int doctorId)
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"
        SELECT *
        FROM Doctors
        WHERE DoctorId=@DoctorId";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@DoctorId", doctorId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);
            }

            return dt;
        }
    }
}



