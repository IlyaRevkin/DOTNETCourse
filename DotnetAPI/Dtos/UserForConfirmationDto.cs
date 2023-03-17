namespace DotnetAPI.Dtos
{
    partial class UserForConfirmationDto
    {
        public byte[] PasswordHash { get; set; } = new byte[0];
        public byte[] PasswordSalt { get; set; } = new byte[0];
    }
}