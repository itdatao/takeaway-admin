package com.ruoyi.takeaway.utils;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.takeaway.domain.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;

import java.util.Date;

/**
 * @Author Huhuitao
 * @Date 2021/1/25 20:06
 */
public class JwtUtil {

    @Value("${token.header}")
    private static final String SUBJECT = "takeaway";
    //秘钥
    @Value("${token.secret}")
    private static final String APPSECRET = "school";
    ////过期时间，毫秒，30分钟
    @Value("${token.expireTime}")
    private static final long EXPIRE = 1000 * 60 * 30;


    /**
     * 生成jwt token
     *
     * @param member
     * @return
     */
    public static String geneJsonWebToken(User member) {

        if (member == null || StringUtils.isEmpty(member.getId())
                || StringUtils.isEmpty(member.getNickname())
                || StringUtils.isEmpty(member.getAvatar())) {
            return null;
        }
        String token = Jwts.builder().setSubject(SUBJECT)
                .claim("id", member.getId())
                .claim("nickname", member.getNickname())
                .claim("avatar", member.getAvatar())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE))
                .signWith(SignatureAlgorithm.HS256, APPSECRET).compact();

        return token;
    }


    /**
     * 校验jwt token
     *
     * @param token
     * @return
     */
    public static Claims checkJWT(String token) {
        Claims claims = Jwts.parser().setSigningKey(APPSECRET).parseClaimsJws(token).getBody();
        return claims;
    }

}
