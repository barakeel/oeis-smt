;; sequence(s): A214863
;; terms: 11 15 27 31 43 47 59 63 75 79 91 95 107 111 123 127 139 143 155 159
;; small program: loop(2 * (2 + x), 2, (x - (x mod 2)) + x) - 1
;; fast program: 1 + (2 + (2 * (2 * (2 + ((x - (x mod 2)) + x)))))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ (- x (modf x 2)) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (* 2 (* 2 (+ 2 (+ (- x (modf x 2)) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
