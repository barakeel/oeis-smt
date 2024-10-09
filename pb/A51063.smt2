;; sequence(s): A51063
;; terms: 9 18 36 45 63 72 90 99 117 126 144 153 171 180 198 207 225 234 252 261
;; small program: loop((x + x) + x, 2, 1 + ((x div 2) + x))
;; fast program: (1 + 2) * ((1 + 2) * (1 + ((x div 2) + x)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (+ (divf x 2) x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (* (+ 1 2) (+ 1 (+ (divf x 2) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
