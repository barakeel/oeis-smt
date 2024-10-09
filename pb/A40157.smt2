;; sequence(s): A40157
;; terms: 13 13 26 13 26 13 26 13 26 13 26 13 26 13 26 13 26 13 26 13
;; small program: loop(1 + (x * x), 2, 2) div (1 + (if x <= 0 then 1 else (x mod 2)))
;; fast program: (1 + (2 * (2 + (2 + 2)))) * (2 - ((if x <= 0 then 1 else x) mod 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (divf v0 (+ 1 (ite (<= x 0) 1 (modf x 2)))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (- 2 (modf (ite (<= x 0) 1 x) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
